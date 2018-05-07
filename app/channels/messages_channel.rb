class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "MessagesChannel:#{params[:room]}"
  end

  def unsubscribed
    stop_all_streams
  end
end
