class Accreditation < ApplicationRecord
  belongs_to :user
  belongs_to :sei_process

  validate :check_date, on: :update
  def check_date
    if (end_date == nil) || (end_date < start_date)
      self.errors.add(:end_date, 'Data inválida')
      return false
    end
    true
  end
end
