require 'spec_helper'

describe Issues::ExportCsvService, services: true do
  let(:user) { create(:user) }
  let(:project) { create(:empty_project, :public) }
  let!(:issue)  { create(:issue, project: project, author: user) }
  let(:subject) { described_class.new(Issue.all) }

  it 'renders csv to string' do
    expect(subject.render).to be_a String
  end

  describe '#email' do
    it 'emails csv' do
      expect{ subject.email(user, project) }.to change(ActionMailer::Base.deliveries, :count)
    end
  end

  def csv
    CSV.parse(subject.render, headers: true)
  end

  context 'includes' do
    let(:milestone) { create(:milestone, title: 'v1.0', project: project) }
    let(:idea_label) { create(:label, project: project, title: 'Idea') }
    let(:feature_label) { create(:label, project: project, title: 'Feature') }

    before do
      issue.update!(milestone: milestone,
                    assignee: user,
                    description: 'Issue with details',
                    due_date: DateTime.new(2014, 3, 2),
                    created_at: DateTime.new(2015, 4, 3, 2, 1, 0),
                    updated_at: DateTime.new(2016, 5, 4, 3, 2, 1),
                    labels: [feature_label, idea_label])
    end

    specify 'title' do
      expect(csv[0]['Title']).to eq issue.title
    end

    specify 'description' do
      expect(csv[0]['Description']).to eq issue.description
    end

    specify 'author name' do
      expect(csv[0]['Author']).to eq issue.author_name
    end

    specify 'assignee name' do
      expect(csv[0]['Assignee']).to eq issue.assignee_name
    end

    specify 'confidential' do
      expect(csv[0]['Confidential']).to eq 'false'
    end

    specify 'milestone' do
      expect(csv[0]['Milestone']).to eq issue.milestone.title
    end

    specify 'labels' do
      expect(csv[0]['Labels']).to eq 'Feature,Idea'
    end

    specify 'due_date' do
      expect(csv[0]['Due Date']).to eq '2014-03-02'
    end

    specify 'created_at' do
      expect(csv[0]['Created At (UTC)']).to eq '2015-04-03 02:01:00'
    end

    specify 'updated_at' do
      expect(csv[0]['Updated At (UTC)']).to eq '2016-05-04 03:02:01'
    end
  end

  context 'with minimal details' do
    it 'renders labels as nil' do
      expect(csv[0]['Labels']).to eq nil
    end
  end
end
