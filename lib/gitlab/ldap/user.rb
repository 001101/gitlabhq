require 'gitlab/o_auth/user'

# LDAP extension for User model
#
# * Find or create user from omniauth.auth data
# * Links LDAP account with existing user
# * Auth LDAP user with login and password
#
module Gitlab
  module LDAP
    class User < Gitlab::OAuth::User
      class << self
        def find_by_uid_and_provider(uid, provider)
          # LDAP distinguished name is case-insensitive
          identity = ::Identity.
            where(provider: provider).
            where('lower(extern_uid) = ?', uid.downcase).last
          identity && identity.user
        end
      end

      def initialize(auth_hash)
        super
        update_user_attributes
      end

      # instance methods
      def gl_user
        @gl_user ||= find_by_uid_and_provider || find_by_email || build_new_user
      end

      def find_by_uid_and_provider
        self.class.find_by_uid_and_provider(
          auth_hash.uid.downcase, auth_hash.provider)
      end

      def find_by_email
        ::User.find_by(email: auth_hash.email)
      end

      def update_user_attributes
        return unless persisted?

        gl_user.skip_reconfirmation!
        gl_user.email = auth_hash.email

        # If we don't have an identity for this provider yet, create one
        if gl_user.identities.find_by(provider: auth_hash.provider).nil?
          gl_user.identities.new(extern_uid: auth_hash.uid, provider: auth_hash.provider)
        else # Update the UID attribute for this provider in case it has changed
          identity = gl_user.identities.select { |identity|  identity.provider == auth_hash.provider }
          identity.first.extern_uid = auth_hash.uid
        end

        gl_user
      end

      def changed?
        gl_user.changed? || gl_user.identities.any?(&:changed?)
      end

      def block_after_signup?
        ldap_config.block_auto_created_users
      end

      def allowed?
        Gitlab::LDAP::Access.allowed?(gl_user)
      end

      def ldap_config
        Gitlab::LDAP::Config.new(auth_hash.provider)
      end
    end
  end
end
