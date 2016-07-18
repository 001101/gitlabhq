module Ci
  class ProcessPipelineService < BaseService
    attr_reader :pipeline

    COMPLETED_STATUSES = %w(success failed canceled skipped)

    def execute(pipeline)
      @pipeline = pipeline

      # This a method that will ensure that our pipeline does have all builds for all stages created
      if created_builds.empty?
        create_builds!
      end

      stage_indexes_with_created_builds.any? do |index|
        process_stage(index).any?
      end
    end

    private

    def create_builds!
      Ci::CreatePipelineBuildsService.new(project, user).execute(pipeline)
    end

    def process_stage(index)
      status = status_for_prior_stages(index)

      created_builds_in_stage(index).select do |build|
        process_build(build, status)
      end
    end

    def process_build(build, status)
      return false unless COMPLETED_STATUSES.include?(status)

      if valid_statuses_for_when(build.when).include?(status)
        build.queue
        true
      else
        build.skip
        false
      end
    end

    def valid_statuses_for_when(value)
      case value
      when 'on_success', nil
        %w[success]
      when 'on_failure'
        %w[failed]
      when 'always'
        %w[success failed]
      else
        []
      end
    end

    def status_for_prior_stages(index)
      pipeline.builds.where('stage_idx < ?', index).latest.status || 'success'
    end

    def stage_indexes_with_created_builds
      created_builds.order(:stage_idx).pluck('distinct stage_idx')
    end

    def created_builds_in_stage(index)
      created_builds.where(stage_idx: index)
    end

    def created_builds
      pipeline.builds.created
    end
  end
end
