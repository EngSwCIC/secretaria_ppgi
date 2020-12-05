json.extract! entry, :id, :title, :content, :created_at, :updated_at
json.url wiki_entry_url(entry, format: :json)
