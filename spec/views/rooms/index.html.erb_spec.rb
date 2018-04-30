require 'rails_helper'

RSpec.describe "rooms/index", type: :view do
  before(:each) do
    assign(:rooms, [
      Room.create!(name:'yo mummas room'),
      Room.create!(name:'yo puppas room')
    ])
  end

  it "renders a list of rooms" do
    render
  end
end
