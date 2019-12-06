class Budget < ApplicationRecord
  has_many :logs

  validates :value, presence: true

end
