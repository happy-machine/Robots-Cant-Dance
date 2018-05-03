require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
  describe 'relations' do
    it { should have_many(:messages) }
    it { should have_and_belong_to_many(:rooms) }
  end
  describe 'paperclip attachments' do
    it { should have_db_column("avatar_file_name").of_type(:string) }
    it { should have_db_column("avatar_content_type").of_type(:string) }
    it { should have_db_column("avatar_file_size").of_type(:integer) }
  end
end
