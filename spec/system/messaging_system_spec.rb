require "rails_helper"

RSpec.describe "Messaging", :type => :system do
  let(:valid_user){
    create(:user)
  }
  
  before do
    @room = create(:room, creator: valid_user)
    @room.messages.create!(content: "Message 1", user: valid_user, created_at: Time.parse('2018-04-30T12:01:00Z'))
    @room.messages.create!(content: "Message 2", user: valid_user, created_at: Time.parse('2018-04-30T12:02:00.1Z'))
  end
  
  def login_as(user)
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'pass123'    
    click_button('Log in')
    expect(page).to have_text 'Select a room to get started'
  end

  it "enables me to send messages", js: true do
    login_as(valid_user)
    visit room_path(@room)
    expect(page).to have_text("Message 2")
    fill_in 'content', with: "This is a new message"
    click_button 'Post Message'
    expect(page).to have_text("This is a new message")
    #take_screenshot
  end
end
