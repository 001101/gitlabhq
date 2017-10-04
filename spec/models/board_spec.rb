require 'rails_helper'

describe Board do
  describe 'relationships' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to belong_to(:milestone) }
    it { is_expected.to belong_to(:assignee).class_name('User') }
    it { is_expected.to have_many(:board_filter_labels) }
    it { is_expected.to have_many(:labels).through(:board_filter_labels) }

    it { is_expected.to have_many(:lists).order(list_type: :asc, position: :asc).dependent(:delete_all) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:project) }
  end
end
