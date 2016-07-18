module Ci
  class CreatePipelineService < BaseService
    attr_reader :pipeline

    def execute(skip_ci: true, save_on_errors: true, trigger_request: nil)
      @pipeline = Ci::Pipeline.new(
        project: project,
        ref: ref,
        sha: sha,
        before_sha: before_sha,
        tag: tag?,
        trigger_requests: [trigger_request].compact,
        user: current_user
      )

      unless project.builds_enabled?
        return error('Pipeline is disabled')
      end

      unless trigger_request || can?(current_user, :create_pipeline, project)
        return error('Insufficient permissions to create a new pipeline')
      end

      unless project.repository.ref_exists?(ref)
        return error('Reference not found')
      end

      unless commit
        return error('Commit not found')
      end

      unless pipeline.config_processor
        unless pipeline.ci_yaml_file
          return error('Missing .gitlab-ci.yml file')
        end
        return error(pipeline.yaml_errors, save: save_on_errors)
      end

      if skip_ci && skip_ci?
        return error('Creation of pipeline is skipped', save: save_on_errors)
      end

      unless pipeline.builds_attributes.present?
        return error('No builds for this pipeline.')
      end

      pipeline.save
      pipeline.process!
      pipeline
    end

    private

    def skip_ci?
      pipeline.git_commit_message =~ /\[(ci skip|skip ci)\]/i if pipeline.git_commit_message
    end

    def commit
      @commit ||= project.commit(origin_sha || origin_ref)
    end

    def sha
      commit.try(:id)
    end

    def before_sha
      params[:checkout_sha] || params[:before] || Gitlab::Git::BLANK_SHA
    end

    def origin_sha
      params[:checkout_sha] || params[:after]
    end

    def origin_ref
      params[:ref]
    end

    def tag?
      project.repository.find_tag(ref).present?
    end

    def ref
      Gitlab::Git.ref_name(origin_ref)
    end

    def valid_sha?
      origin_sha != Gitlab::Git::BLANK_SHA
    end

    def error(message, save: false)
      pipeline.errors.add(:base, message)
      if save
        pipeline.save
        pipeline.touch
      end
      pipeline
    end
  end
end
