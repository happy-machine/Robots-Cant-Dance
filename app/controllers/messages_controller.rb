class MessagesController < ApplicationController
  def create
    p params
    message_params
    @room = Room.find(params[:room_id])
    @user = User.find(params[:type])
    @message = @room.messages.create!(content: params[:content], user: @user, room: @room)
    p @room
    p @user
    p @message
  end

  private
    def message_params
      params.require(:message).permit(:type, :room_id, :message, :content)
    end

end
