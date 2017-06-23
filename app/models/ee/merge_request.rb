module EE
  module MergeRequest
    def ff_merge_possible?
      project.repository.is_ancestor?(target_branch_sha, diff_head_sha)
    end

    def should_be_rebased?
      self.project.ff_merge_must_be_possible? && !ff_merge_possible?
    end

    def rebase_dir_path
      File.join(::Gitlab.config.shared.path, 'tmp/rebase', source_project.id.to_s, id.to_s).to_s
    end

    def squash_dir_path
      File.join(::Gitlab.config.shared.path, 'tmp/squash', source_project.id.to_s, id.to_s).to_s
    end

    def rebase_in_progress?
      # The source project can be deleted
      return false unless source_project

      File.exist?(rebase_dir_path) && !clean_stuck_rebase
    end

    def squash_in_progress?
      # The source project can be deleted
      return false unless source_project

      File.exist?(squash_dir_path) && !clean_stuck_squash
    end

    def clean_stuck_rebase
      if File.mtime(rebase_dir_path) < 15.minutes.ago
        FileUtils.rm_rf(rebase_dir_path)
        true
      end
    end

    def clean_stuck_squash
      if File.mtime(squash_dir_path) < 15.minutes.ago
        FileUtils.rm_rf(squash_dir_path)
        true
      end
    end
  end
end
