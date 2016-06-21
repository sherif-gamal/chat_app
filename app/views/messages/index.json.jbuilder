json.array!(@messages) do |message|
  json.extract! message, :id, :sender_name, :receiver_name, :content
  json.url message_url(message, format: :json)
end
