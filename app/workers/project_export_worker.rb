class ProjectExportWorker
  include Sidekiq::Worker

  # TODO: enabled retry - disabled for QA purposes
  sidekiq_options queue: :gitlab_shell, retry: false

  def perform(current_user_id, project_id)
    current_user = User.find(current_user_id)
    project = Project.find(project_id)
    ::Projects::ImportExport::ExportService.new(project, current_user).execute
    # TODO : Handle errors
  end
end
