module EpicIssues
  class CreateService < IssuableLinks::CreateService
    private

    def after_create
      issuable.epic_issues
        .where('id NOT IN (?)', @created_links.map(&:id))
        .update_all("position = position + #{@created_links.count}")
    end

    def relate_issues(referenced_issue)
      link = existing_links.find { |link| link.issue == referenced_issue } || EpicIssue.new(issue: referenced_issue)
      link.epic = issuable
      link.position = @created_links.count + 1
      link.save

      link
    end

    def create_notes(referenced_issue)
      SystemNoteService.epic_issue(issuable, referenced_issue, current_user, :added)
      SystemNoteService.issue_on_epic(referenced_issue, issuable, current_user, :added)
    end

    def extractor_context
      { group: issuable.group }
    end

    def linkable_issues(issues)
      return [] unless can?(current_user, :admin_epic, issuable.group)

      issues.select { |issue| issuable_group_descendants.include?(issue.project.group) }
    end

    def issuable_group_descendants
      @descendants ||= issuable.group.self_and_descendants
    end

    def existing_links
      @existing_links ||= EpicIssue.where(issue_id: referenced_issues.map(&:id))
    end
  end
end
