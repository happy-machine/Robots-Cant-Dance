class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(content: params[:content], user: current_user)
    if @message.save
      ActionCable.server.broadcast "MessagesChannel:#{@room.id}", message: {message_obj: @message, current_user: current_user, user_name: @message.user.name}                       
    else
    flash[:alert] = "Message shouldn't be blank"
    redirect_to room_path(@room)
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @message = @room.messages.find(params[:id])
    if @message
      @message.destroy
    end
    p params[:room_id]
    redirect_to room_path(params[:room_id],format:'html'), status: 303
  end

  private

  def message_params
    params.permit(:room_id, :id)
  end
end
