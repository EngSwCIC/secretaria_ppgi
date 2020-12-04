json.extract! faqs_suggestion, :id, :question, :answer, :topic_id, :created_at, :updated_at
json.url faqs_suggestion_url(faqs_suggestion, format: :json)
