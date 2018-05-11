require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:valid_user){
    create(:user)
  }
    
  before do
    sign_in valid_user
    @room = create(:room)
  end
  
  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {room_id: @room.id}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    
    context "with valid params" do
      it "creates a new message" do
        expect {
          post :create, params: {room_id: @room.id, content: "message here"}
        }.to change(Message, :count).by(1)
      end

      it "redirects to the room" do
        post :create, params: {room_id: @room.id, content: "message here"}
        expect(response).to redirect_to(@room)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        post :create, params: {room_id: @room.id}
        expect(response).to be_success
      end
    end
  end

end