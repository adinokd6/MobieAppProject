json.extract! message, :id, :MessageId, :From, :To, :Text, :Date, :created_at, :updated_at
json.url message_url(message, format: :json)
