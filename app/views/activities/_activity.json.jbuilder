json.extract! activity, :id, :title, :description, :due_date, :status, :activity_type_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
