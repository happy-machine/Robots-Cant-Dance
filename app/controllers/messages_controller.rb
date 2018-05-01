class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.create!(content: params[:message][:content], user: current_user, room: @room)
    p @room.id
    redirect_to room_path(@room)
  end

  private
    def message_params
      params.require(:message).permit(:type, :room_id, [:message][:content])
    end

end
