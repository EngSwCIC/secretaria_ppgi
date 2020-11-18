class Accreditation < ApplicationRecord
  belongs_to :user
  belongs_to :sei_process
  validates :sei_process, uniqueness: true

  validate :check_role, on: [:create, :update]
  def check_role
    if Current.user.role != 'administrator'
      self.errors.add(:user_id, 'without permission')
      return false
    end
    true
  end
  
  validate :check_date, on: :update
  def check_date
    if (start_date == nil) || (end_date == nil) || (end_date < start_date)
      self.errors.add(:end_date, 'invalid')
      return false
    end
    true
  end
end
