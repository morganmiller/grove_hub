require 'rails_helper'

RSpec.describe ActionItem, type: :model do
  before { @action_item = FactoryGirl.build(:action_item) }
  subject { @action_item }

  it { should respond_to(:description) }

  it { should be_valid }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:category) }
  
end
