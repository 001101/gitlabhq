class StatusEntity < Grape::Entity
  include RequestAwareEntity

  expose :icon, :text, :label, :group
  expose :status_tooltip, as: :tooltip
  expose :has_details?, as: :has_details
  expose :details_path

  expose :favicon do |status|
    ActionController::Base.helpers.image_path(status.favicon)
  end

  expose :action, if: -> (status, _) { status.has_action? } do
    expose :action_icon, as: :icon
    expose :action_title, as: :title
    expose :action_path, as: :path
    expose :action_method, as: :method
  end
end
