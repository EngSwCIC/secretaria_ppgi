class Faq < ApplicationRecord
  validates :topico, presence: true
  validates :pergunta, presence: true
  validates :resposta, presence: true

end
