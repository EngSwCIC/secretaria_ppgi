class Solicitation < ApplicationRecord
  belongs_to :user

  validates :kind, presence: true
  validates :departure, presence: true
  validates :return, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :description, presence: true
  validates :status, presence: true

  enum kind: { passagem: 0, diaria: 1 }
  enum status: { reprovado: 0, analise: 1, aprovado: 2 }
end
