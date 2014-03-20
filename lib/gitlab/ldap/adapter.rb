#-------------------------------------------------------------------
#
# Copyright (C) 2013 GitLab.com - Distributed under the MIT Expat License
#
#-------------------------------------------------------------------

module Gitlab
  module LDAP
    class Adapter
      attr_reader :ldap

      def self.open(&block)
        Net::LDAP.open(adapter_options) do |ldap|
          block.call(self.new(ldap))
        end
      end

      def self.config
        Gitlab.config.ldap
      end

      def self.adapter_options
        encryption = config['method'].to_s == 'ssl' ? :simple_tls : nil

        options = {
          host: config['host'],
          port: config['port'],
          encryption: encryption
        }

        auth_options = {
          auth: {
            method: :simple,
            username: config['bind_dn'],
            password: config['password']
          }
        }

        if config['password'] || config['bind_dn']
          options.merge!(auth_options)
        end
        options
      end


      def initialize(ldap=nil)
        @ldap = ldap || Net::LDAP.new(self.class.adapter_options)
      end

      # Get LDAP groups from ou=Groups
      #
      # cn - filter groups by name
      #
      # Ex.
      #   groups("dev*") # return all groups start with 'dev'
      #
      def groups(cn = "*", size = nil)
        options = {
          base: config['group_base'],
          filter: Net::LDAP::Filter.eq("cn", cn)
        }

        options.merge!(size: size) if size

        ldap.search(options).map do |entry|
          Gitlab::LDAP::Group.new(entry, self)
        end
      end

      def group(*args)
        groups(*args).first
      end

      def users(field, value)
        if field.to_sym == :dn
          options = {
            base: value
          }
        else
          options = {
            base: config['base'],
            filter: Net::LDAP::Filter.eq(field, value)
          }
        end

        if config['user_filter'].present?
          user_filter = Net::LDAP::Filter.construct(config['user_filter'])

          options[:filter] = if options[:filter]
                               Net::LDAP::Filter.join(options[:filter], user_filter)
                             else
                               user_filter
                             end
        end

        entries = ldap.search(options).select do |entry|
          entry.respond_to? config.uid
        end

        entries.map do |entry|
          Gitlab::LDAP::Person.new(entry)
        end
      end

      def user(*args)
        users(*args).first
      end

      def dn_matches_filter?(dn, filter)
        ldap.search(base: dn, filter: filter, attributes: %w{dn}).any?
      end

      private

      def config
        @config ||= self.class.config
      end
    end
  end
end
