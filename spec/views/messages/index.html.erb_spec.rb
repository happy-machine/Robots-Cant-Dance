require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(content:'message content'),
      Message.create!(content:'message content')
    ])
  end

  it "renders a list of messages" do
    render
  end
end
