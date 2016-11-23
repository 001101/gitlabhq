//= require vue
//= require_directory ./components
/*
      .block.assignee
        .sidebar-collapsed-icon.sidebar-collapsed-user{data: {toggle: "tooltip", placement: "left", container: "body"}, title: (issuable.assignee.name if issuable.assignee)}
          - if issuable.assignee
            = link_to_member(@project, issuable.assignee, size: 24)
          - else
            = icon('user')
        .title.hide-collapsed
          Assignee
          = icon('spinner spin', class: 'block-loading')
          - if can_edit_issuable
            = link_to 'Edit', '#', class: 'edit-link pull-right'
        .value.hide-collapsed
          - if issuable.assignee
            = link_to_member(@project, issuable.assignee, size: 32, extra_class: 'bold') do
              - if issuable.instance_of?(MergeRequest) && !issuable.can_be_merged_by?(issuable.assignee)
                %span.pull-right.cannot-be-merged{ data: { toggle: 'tooltip', placement: 'left' }, title: 'Not allowed to merge' }
                  = icon('exclamation-triangle')
              %span.username
                = issuable.assignee.to_reference
          - else
            %span.assign-yourself.no-value
              No assignee
              - if can_edit_issuable
                \-
                %a.js-assign-yourself{ href: '#' }
                  assign yourself

        .selectbox.hide-collapsed
          = f.hidden_field 'assignee_id', value: issuable.assignee_id, id: 'issue_assignee_id'
          = dropdown_tag('Select assignee', options: { toggle_class: 'js-user-search js-author-search', title: 'Assign to', filter: true, dropdown_class: 'dropdown-menu-user dropdown-menu-selectable dropdown-menu-author', placeholder: 'Search users', data: { first_user: (current_user.username if current_user), current_user: true, project_id: (@project.id if @project), author_id: issuable.author_id, field_name: "#{issuable.to_ability_name}[assignee_id]", issue_update: issuable_json_path(issuable), ability_name: issuable.to_ability_name, null_user: true } })
      
*/ 
