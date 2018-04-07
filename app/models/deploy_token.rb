class DeployToken < ActiveRecord::Base
  include Expirable
  include TokenAuthenticatable
  add_authentication_token_field :token

  AVAILABLE_SCOPES = %w(read_repo read_registry).freeze

  serialize :scopes, Array # rubocop:disable Cop/ActiveRecordSerialize

  validates :scopes, presence: true

  belongs_to :project

  before_save :ensure_token

  scope :active, -> { where("revoked = false AND (expires_at >= NOW() OR expires_at IS NULL)") }

  def revoke!
    update!(revoked: true)
  end

  def self.redis_shared_state_key(user_id)
    "gitlab:personal_access_token:#{user_id}"
  end
end
