class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(content: params[:content], user: current_user)
    if @message.save
=begin
      ActionCable.server.broadcast "MessagesChannel:#{@room.id}", message: json.object do
        json.message_object @message
        json.current_user current_user
        json.user_name @message.user.name
      end
=end
      ActionCable.server.broadcast "MessagesChannel:#{@room.id}", message: {message_obj: @message, current_user: current_user, user_name: @message.user.name}                                           
    else
      flash[:alert] = "Message shouldn't be blank"
      redirect_to room_path(@room)
    end
  end

  def show
    @message=Message.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render :show }
    end
  end

  def index
    @messages=Room.find(params[:room_id]).messages.all
    respond_to do |format|
      format.html { render :index }
      format.json { render :index }
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @message = @room.messages.find(params[:id])
    if @message
      @message.destroy
    end
    redirect_to room_path(params[:room_id],format:'html'), status: 303
  end
end
