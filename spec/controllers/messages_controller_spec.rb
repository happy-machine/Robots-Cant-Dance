require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:valid_user) {
    User.create!(name: "test", email: "test@test.com", password: "testing" , is_moderator: true)
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
    Message.create!(content: "test_room", user: valid_user, room: valid_room)
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
      it { should permit(:room_id, :id).for(room_messages_path,params: {room_id: 1}) }
      
  end

  describe "DELETE #destroy" do
    context "with valid params" do
      it "deletes a message" do
        delete :destroy, params: {room_id: @room.id, id: valid_attributes.id}, session: valid_session
        expect(response).to redirect_to(room_path(@room)+'.html')
      end
    end
  end

end
