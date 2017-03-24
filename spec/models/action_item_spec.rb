require 'rails_helper'

RSpec.describe ActionItem, type: :model do
  before { @action_item = FactoryGirl.build(:action_item) }
  subject { @action_item }

  it { should respond_to(:description) }
  it { should respond_to(:category) }
  it { should respond_to(:algorithm) }

  it { should be_valid }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:category) }

  describe '#category' do
    before { @action_item = FactoryGirl.create(:action_item) }

    it 'filters action items by category name' do
      categorized_actions = ActionItem.category(@action_item.category.name)
      expect(categorized_actions).to include(@action_item)
    end
  end

end
