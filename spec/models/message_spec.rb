require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:room) }
  end
  describe 'relations' do
    it { should belong_to(:room) }
    it { should belong_to(:user) }
  end
end
