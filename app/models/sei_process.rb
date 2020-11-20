class SeiProcess < ApplicationRecord
  belongs_to :user
  has_many_attached :documents
  validates :documents, attached: true

  enum status: {
    Espera: 0,
    Aprovado: 1,
    Rejeitado: 2
  }

  validate :check_signed_in, on: :create
  def check_signed_in
    if Current.user == nil
      self.errors.add(:base, 'Usuário sem permissão')
      return false
    end
    true
  end

  validate :check_role, on: :update
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

  before_destroy :check_permission
  def allow_deletion!
    @allow_deletion = true
  end
  def check_permission
    throw(:abort) unless @allow_deletion || current_user_is_admin
  end
end
