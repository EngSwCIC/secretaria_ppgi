class Budget < ApplicationRecord
  has_many :logs

  validates :value, presence: true
  validate :limit, on: :create

  def limit
    if Budget.count >= 1
      self.errors.add(:base,'Não pode haver mais de um orçamento')
    end
  end
end
