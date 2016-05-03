require 'spec_helper'

describe 'Search', feature: true  do
  let(:user) { create(:user) }
  let(:project) { create(:project, namespace: user.namespace) }

  before do
    login_with(user)
    project.team << [user, :reporter]
    visit search_path
  end

  describe 'Search Page', feature: true  do

    before do
      visit search_path
    end

    it 'top right search form is not present' do
      expect(page).not_to have_selector('.search')
    end

    describe 'searching for Projects' do
      it 'finds a project' do
        page.within '.search-holder' do
          fill_in "search", with: project.name[0..3]
          click_button "Search"
        end

        expect(page).to have_content project.name
      end
    end

    context 'search for comments' do
      it 'finds a snippet' do
        snippet = create(:project_snippet, :private, project: project, author: user, title: 'Some title')
        note = create(:note,
                      noteable: snippet,
                      author: user,
                      note: 'Supercalifragilisticexpialidocious',
                      project: project)
        # Must visit project dashboard since global search won't search
        # everything (e.g. comments, snippets, etc.)
        visit namespace_project_path(project.namespace, project)

        page.within '.search' do
          fill_in 'search', with: note.note
          click_button 'Go'
        end

        click_link 'Comments'

        expect(page).to have_link(snippet.title)
      end
    end
  end

  describe 'Right header search field', feature: true  do

    describe 'Search in project page' do
      before do
        visit namespace_project_path(project.namespace, project)
      end

      it 'top right search form is present' do
        expect(page).to have_selector('#search')
      end

      it 'top right search form contains location badge' do
        expect(page).to have_selector('.search-location-badge')
      end

      context 'cliking the search field', js: true do
        it 'should show category search dropdown' do
          page.find('#search').click

          expect(page).to have_selector('.dropdown-header', text: /go to in #{project.name}/i)
        end
      end

      context 'click the links in the catgeory search dropdown', js: true do

        before do
          page.find('#search').click
        end

        it 'should take user to her issues page when issues assigned is clicked' do
          find('.category-dropdown-search').click_link 'Issues Assigned to me'
          sleep 2

          expect(page).to have_selector('.issues-holder')
          expect(find('.js-assignee-search .dropdown-toggle-text')).to have_content(user.name)
        end

        it 'should take user to her issues page when issues authored is clicked' do
          find('.category-dropdown-search').click_link "Issues I've created"
          sleep 2

          expect(page).to have_selector('.issues-holder')
          expect(find('.js-author-search .dropdown-toggle-text')).to have_content(user.name)
        end

        it 'should take user to her MR page when MR assigned is clicked' do
          find('.category-dropdown-search').click_link "Merge Requests Assigned to me"
          sleep 2

          expect(page).to have_selector('.merge-requests-holder')
          expect(find('.js-assignee-search .dropdown-toggle-text')).to have_content(user.name)
        end

        it 'should take user to her MR page when MR authored is clicked' do
          find('.category-dropdown-search').click_link "Merge Requests I've created"
          sleep 2

          expect(page).to have_selector('.merge-requests-holder')
          expect(find('.js-author-search .dropdown-toggle-text')).to have_content(user.name)
        end
      end

      context 'inputing text into the search field', js: true do
        before do
          page.within '.search-input-wrap' do
            fill_in "search", with: project.name[0..3]
          end
        end

        it 'should not display the category search dropdown' do
          expect(page).not_to have_selector('.dropdown-header', text: /go to in #{project.name}/i)
        end
      end
    end
  end
end
