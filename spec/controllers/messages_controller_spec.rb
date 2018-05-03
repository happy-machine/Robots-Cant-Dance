require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:valid_user) {
    User.create!(name: "test", email: "test@test.com", password: "testing")
  }

  let(:valid_room) {
    Room.create!(name: "room")
  }
  before do
    @user = valid_user
    sign_in @user
    @room = valid_room
  end
  let(:valid_attributes) {
    {content: "test_room", user: valid_user, room: valid_room}
  }

  let(:invalid_attributes) {
    {content: "", user:"", room:""}
  }
  let(:valid_session) {{}}


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Room" do
        expect {
          post :create, params: {room_id: @room, message: valid_attributes}, session: valid_session
        }.to change(Message, :count).by(1)
      end
    end

      it "redirects to the room's show page" do
        post :create, params: {room_id: @room, message: valid_attributes}, session: valid_session
        expect(response).to redirect_to room_path(@room)
      end


    context "with invalid params" do
      it "redirects to the room's show page, with flash alert" do
        post :create, params: {room_id: @room, message: invalid_attributes}, session: valid_session
        expect(response).to redirect_to room_path(@room)
        expect(flash[:alert]).to be_present
      end
    end
  end

end
