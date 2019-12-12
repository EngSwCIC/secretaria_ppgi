##
# Essa classe representa a model para as entradas do FAQ

class Faq < ApplicationRecord
  validates :topico, presence: true
  validates :pergunta, presence: true
  validates :resposta, presence: true
  has_many :faq_sugestion, dependent: :destroy
end
