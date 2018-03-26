class ProtectedBranchPolicy < BasePolicy
  delegate { @subject.project }

  condition(:requires_admin_to_unprotect?, scope: :subject) do
    @subject.name == 'master' && Gitlab::CurrentSettings.only_admins_can_unprotect_master_branch?
  end

  rule { can?(:admin_project) }.policy do
    enable :create_protected_branch
    enable :update_protected_branch
    enable :destroy_protected_branch
  end

  rule { requires_admin_to_unprotect? & ~admin }.policy do
    prevent :create_protected_branch
    prevent :update_protected_branch
    prevent :destroy_protected_branch
  end
end
