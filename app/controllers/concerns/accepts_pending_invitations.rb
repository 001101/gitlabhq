module AcceptsPendingInvitations
  extend ActiveSupport::Concern

  def accept_pending_invitations
    return unless resource.active_for_authentication?

    clear_stored_location_for(resource) if Member.accept_pending_invitations(resource).any?
  end

  def clear_stored_location_for(resource)
    session_key = stored_location_key_for(resource)

    session.delete(session_key)
  end
end