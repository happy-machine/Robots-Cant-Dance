require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(name:'dan',email:'dan@aim.com',password:'bdubdubdubdu'))
  end

  it "renders attributes in <p>" do
    render
  end
end
