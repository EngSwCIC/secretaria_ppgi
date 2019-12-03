json.extract! faq_sugestion, :id, :topico, :pergunta, :resposta, :faq_id, :created_at, :updated_at
json.url faq_sugestion_url(faq_sugestion, format: :json)
