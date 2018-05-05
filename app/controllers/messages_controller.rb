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

  def destroy
    puts "destroying"
    @room = Room.find(params[:room_id])
    @message = @room.messages.find(params[:id])
    if @message
      @message.destroy
    end
    puts "now params"
    p params[:room_id]
    redirect_to room_path(params[:room_id],format:'html'), status: 303
  end

  private

  def message_params
    params.permit(:room_id, :id)
  end
end
