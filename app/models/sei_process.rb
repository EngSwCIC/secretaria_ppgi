class SeiProcess < ApplicationRecord
  belongs_to :user
  has_many_attached :documents
  validates :documents, attached: true

  enum status: {
    Espera: 0,
    Aprovado: 1,
    Rejeitado: 2
  }
end
