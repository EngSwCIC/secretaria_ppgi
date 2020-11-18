class SeiProcess < ApplicationRecord
  belongs_to :user
  has_many_attached :documents
  validates :documents, attached: true

  enum status: {
    Espera: 0,
    Aprovado: 1,
    Rejeitado: 2
  }

  validate :check_role_to_change_status, on: [:create, :update]
  def check_role_to_change_status
    if (Current.user.role != 'administrator') && (status != 'Espera')
      self.errors.add(:user_id, 'without permission')
      return false
    end
    true
  end
end
