require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
  describe 'relations' do
    it { should have_many(:messages) }
    it { should have_and_belong_to_many(:users) }
  end
end
