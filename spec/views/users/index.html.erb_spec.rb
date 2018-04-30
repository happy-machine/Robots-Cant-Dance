require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(name:'dan',password:'dedeedded',email:'dan@sio.com'),
      User.create!(name:'dad',password:'dedeedddd',email:'dad@sio.com')
    ])
  end

  it "renders a list of users" do
    render
  end
end
