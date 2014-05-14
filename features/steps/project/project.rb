class ProjectFeature < Spinach::FeatureSteps
  include SharedAuthentication
  include SharedProject
  include SharedPaths

  step 'change project settings' do
    fill_in 'project_name', with: 'NewName'
    uncheck 'project_issues_enabled'
  end

  step 'I save project' do
    click_button 'Save changes'
  end

  step 'I should see project with new settings' do
    find_field('project_name').value.should == 'NewName'
    find('#project_issues_enabled').should_not be_checked
    find('#project_merge_requests_enabled').should be_checked
  end

  step 'change project path settings' do
    fill_in "project_path", with: "new-path"
    click_button "Rename"
  end

  step 'I should see project with new path settings' do
    project.path.should == "new-path"
  end

  step 'I fill in merge request template' do
    fill_in 'project_merge_requests_template', with: "This merge request should contain the following."
  end

  step 'I should see project with merge request template saved' do
    find_field('project_merge_requests_template').value.should == 'This merge request should contain the following.'
  end
end
