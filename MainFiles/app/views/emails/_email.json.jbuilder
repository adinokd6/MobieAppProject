json.extract! email, :id, :EmailId, :EmailAddress
json.messages email.messages do |message|
  json.From message.From
  json.To message.To
  json.Text message.Text
end
