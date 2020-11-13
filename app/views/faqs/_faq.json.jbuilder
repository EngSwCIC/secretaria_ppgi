json.extract! faq, :id, :Topic, :Question, :Answer, :created_at, :updated_at
json.url faq_url(faq, format: :json)
