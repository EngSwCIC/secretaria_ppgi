class Faq < ApplicationRecord
  validates :pergunta, presence: true
  validates :resposta, presence: true

end
