class Groups::PipelineQuotaController < Groups::ApplicationController
  before_action :authorize_admin_group!

  layout 'group_settings'

  def index
    @projects = @group.projects.page(params[:page])
  end
end
