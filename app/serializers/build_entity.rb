class BuildEntity < Grape::Entity
  include RequestAwareEntity

  expose :id
  expose :name

  expose :build_path do |build|
    path_to(:namespace_project_build, build)
  end

  expose :retry_path do |build|
    path_to(:retry_namespace_project_build, build)
  end

  expose :play_path, if: proc { playable? } do |build|
    path_to(:play_namespace_project_build, build)
  end

  expose :playable?, as: :playable
  expose :created_at
  expose :updated_at
  expose :detailed_status, as: :status, with: StatusEntity

  private

  alias_method :build, :object

  def playable?
    can?(request.user, :play_build, build) && build.playable?
  end

  def detailed_status
    build.detailed_status(request.user)
  end

  def path_to(route, build)
    send("#{route}_path", build.project.namespace, build.project, build)
  end
end
