message_array=[]
@messages.each_with_index do |message,i|
    message_array[i] = { message: message,
        from: User.find(message.user_id).name
        }
end
json.messages message_array