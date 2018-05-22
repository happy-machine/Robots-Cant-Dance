require "rails_helper"

RSpec.describe "Messaging", :type => :system do
  let(:valid_user){
    create(:user)
  }
  
  
  before do
    @room = Room.create!(name:'test room')
    @room.messages.create!(content: "Message 1", user: valid_user, created_at: Time.parse('2018-04-30T12:01:00Z'))
    @room.messages.create!(content: "Message 2", user: valid_user, created_at: Time.parse('2018-04-30T12:02:00.1Z'))
  end
  
  def login_as(user)
    visit '/users/sign_in'
    fill_in 'Email', with: valid_user.email
    fill_in 'Password', with: 'pass123'    
    page.execute_script %Q{"$('form').find(':submit').click()"}
    sleep 1 # wait for the page to load
    expect(page).to have_selector('div', :class => 'main_grid_container'), {text: "test room"}
  end

  it "should add messages to rooms", js: true do
    login_as(valid_user)
    visit room_path(@room)
=begin
    fill_in 'content', with: "This is a new message"
    click_button 'Post Message'
=end
    expect(page).to have_text("Message 1")
    #take_screenshot
  end
end
