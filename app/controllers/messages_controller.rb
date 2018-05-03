class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    if ( params[:message][:content] == "")
      flash[:alert] = "Message shouldn't be blank"
      redirect_to room_path(@room)
    else
      @message = @room.messages.create!(content: params[:message][:content], user: current_user, room: @room)
      redirect_to room_path(@room)
    end
  end
end
