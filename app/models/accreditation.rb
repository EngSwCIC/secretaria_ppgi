class Accreditation < ApplicationRecord
  belongs_to :user
  belongs_to :sei_process
  validates :sei_process, uniqueness: true

  validate :check_role, on: [:create, :update]
  def current_user_is_admin
    Current.user != nil && Current.user.role == 'administrator'
  end
  def check_role
    unless current_user_is_admin
      self.errors.add(:base, 'Usuário sem permissão')
      return false
    end
    true
  end
  
  validate :check_date, on: :update
  def check_date
    if (start_date == nil) || (end_date == nil) || (end_date < start_date)
      self.errors.add(:end_date, 'inválida')
      return false
    end
    true
  end

  before_destroy :check_permission
  def allow_deletion!
    @allow_deletion = true
  end
  def check_permission
    throw(:abort) unless @allow_deletion || current_user_is_admin
  end
end
