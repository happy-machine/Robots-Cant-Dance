json.extract! @message, :id, :user_id, :created_at, :updated_at, :content
json.from User.find(@message.user_id).name