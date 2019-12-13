json.extract! notification, :id, :user_id, :source_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
