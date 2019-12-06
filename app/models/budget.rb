class Budget < ApplicationRecord
  has_many :logs

  validates :value, presence: true

  if Budget.count > 1
    Budget.first.destroy
    Log.first.destroy
  end
end
