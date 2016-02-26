json.array!(@email_notifications) do |email_notification|
  json.extract! email_notification, :id
  json.url email_notification_url(email_notification, format: :json)
end
