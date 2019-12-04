class FaqSugestion < ApplicationRecord
  validates :topico, presence: true
  validates :pergunta, presence: true
  validates :resposta, presence: true
  belongs_to :faq, :class_name=>"Faq", :foreign_key => "faq_id", optional: true
end
