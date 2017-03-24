require 'rails_helper'

RSpec.describe Algorithm, type: :model do
  before do
    @action_item = FactoryGirl.create(:action_item)
    @algorithm = FactoryGirl.build(:algorithm)
  end
  subject { @algorithm }

  it { should respond_to(:formula) }

  it { should be_valid }
  it { should validate_presence_of(:formula) }
end
