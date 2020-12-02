class SeiProcess < ApplicationRecord
  belongs_to :user
  has_many_attached :documents
  validates :documents, attached: true

  enum status: {
    Espera: 0,
    Aprovado: 1,
    Rejeitado: 2
  }
  # Lista os status possíveis para os registros
  def self.all_statuses
    %w[Espera Aprovado Rejeitado]
  end

  # Define se usuário atual está logado e se é administrador do sistema
  def current_user_is_admin
    Current.user != nil && Current.user.role == 'administrator'
  end

  validate :check_signed_in, on: :create
  # Permite criação de processo ou solicitação caso usuário esteja logado
  def check_signed_in
    if Current.user == nil
      self.errors.add(:base, 'Usuário sem permissão')
      return false
    end
    true
  end

  validate :check_role, on: :update
  # Permite atualização de processo ou solicitação por um administrador
  def check_role
    unless current_user_is_admin
      self.errors.add(:base, 'Usuário sem permissão')
      return false
    end
    true
  end

  before_destroy :check_permission
  # Habilita deleção (usado por 'db/seeds.rb')
  def allow_deletion!
    @allow_deletion = true
  end
  # Permite deleção de processo ou solicitação por um administrador ou caso metodo 'allow_deletion!' tenha sido chamado pela instancia
  def check_permission
    throw(:abort) unless @allow_deletion || current_user_is_admin
  end
end
