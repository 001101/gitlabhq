class Projects::TeamMembersController < Projects::ApplicationController
  # Authorize
  before_filter :authorize_admin_project!, except: :leave

  layout "project_settings"

  def index
    @group = @project.group
    @project_members = @project.project_members.order('access_level DESC')
    @project_group_links = @project.project_group_links
  end

  def new
    @user_project_relation = @project.project_members.new
  end

  def create
    users = User.where(id: params[:user_ids].split(','))
    access_level = params[:access_level]
    @project.team << [users, access_level]

    users.each do |user|
      details = {
        add: "user_access",
        as: Gitlab::Access.options_with_owner.key(access_level.to_i),
        target_id: user.id,
        target_type: "User",
        target_details: user.name,
      }
      AuditEventService.new(current_user, @project, details).security_event
    end

    redirect_to namespace_project_team_index_path(@project.namespace, @project)
  end

  def update
    @user_project_relation = @project.project_members.find_by(user_id: member)
    old_access_level = @user_project_relation.human_access

    if @user_project_relation.update_attributes(member_params)
      details = {
        change: "access_level",
        from:  old_access_level,
        to: @user_project_relation.human_access,
        target_id: @user_project_relation.user_id,
        target_type: "User",
        target_details: @user_project_relation.user.name,
      }
      AuditEventService.new(current_user, @project, details).security_event
    end

    unless @user_project_relation.valid?
      flash[:alert] = "User should have at least one role"
    end
    redirect_to namespace_project_team_index_path(@project.namespace, @project)
  end

  def destroy
    @user_project_relation = @project.project_members.find_by(user_id: member)
    user_id = @user_project_relation.user_id
    user_name = @user_project_relation.user.name

    if @user_project_relation.destroy
      details = {
        remove: "user_access",
        target_id: user_id,
        target_type: "User",
        target_details: user_name,
      }
      AuditEventService.new(current_user, @project, details).security_event
    end

    respond_to do |format|
      format.html do
        redirect_to namespace_project_team_index_path(@project.namespace,
                                                      @project)
      end
      format.js { render nothing: true }
    end
  end

  def leave
    @project.project_members.find_by(user_id: current_user).destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render nothing: true }
    end
  end

  def apply_import
    giver = Project.find(params[:source_project_id])
    status = @project.team.import(giver)
    notice = status ? "Successfully imported" : "Import failed"

    redirect_to(namespace_project_team_index_path(project.namespace, project),
                notice: notice)
  end

  protected

  def member
    @member ||= User.find_by(username: params[:id])
  end

  def member_params
    params.require(:project_member).permit(:user_id, :access_level)
  end
end
