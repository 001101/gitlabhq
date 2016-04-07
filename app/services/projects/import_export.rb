module Projects
  module ImportExport
    extend self

    def export_path(relative_path:)
      File.join(storage_path, "#{Time.now.strftime('%Y-%m-%d_%H-%M-%3N')}_gitlab_export/#{relative_path}")
    end

    def project_atts
      %i(name path description issues_enabled wall_enabled merge_requests_enabled wiki_enabled snippets_enabled visibility_level archived)
    end

    def project_tree
      Projects::ImportExport::ImportExportReader.project_tree
    end

    private

    def storage_path
      File.join(Settings.shared['path'], 'tmp/project_exports')
    end
  end
end
