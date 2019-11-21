json.extract! solicitation, :id, :kind, :departure, :return, :origin, :destination, :description, :user_id, :created_at, :updated_at
json.url solicitation_url(solicitation, format: :json)
