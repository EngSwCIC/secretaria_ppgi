json.extract! comment, :id, :content, :created_at, :updated_at
json.url wiki_comment_url(comment, format: :json)
