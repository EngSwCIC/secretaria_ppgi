##
 # Model da classe Accreditation
 # É necessário a presença de um usuário
 # É necessário a presença de um sei_process
 # É necessário a presença de um sei_process único
 # Em métodos com ações de create ou update, é necessário a verificação do método check_role
 # Em métodos com ações de update, é necessário a verificação do método check_date

class Accreditation < ApplicationRecord
  belongs_to :user
  belongs_to :sei_process
  validates :sei_process, uniqueness: true

  validate :check_role, on: [:create, :update]
  ##
   # Define se usuário atual está logado e se é administrador do sistema
  def current_user_is_admin
    Current.user != nil && Current.user.role == 'administrator'
  end
  ## 
   # Permite criação ou atualização do credenciamento por um administrador
   # Retorna "true" caso o usuário seja um administrador ou retorna "false" caso contrário
  def check_role
    unless current_user_is_admin
      self.errors.add(:base, 'Usuário sem permissão')
      return false
    end
    true
  end
  
  validate :check_date, on: :update
  ## 
   # Permite atualização com base em decorrência real de um período (data final superior a data inicial)
   # Retorna "true" caso em caso de data final superior a data inicial ou retorna "false" caso contrário
  def check_date
    if (start_date == nil) || (end_date == nil) || (end_date < start_date)
      self.errors.add(:end_date, 'inválida')
      return false
    end
    true
  end

  before_destroy :check_permission
  ## 
   # Habilita deleção (usado por 'db/seeds.rb')
  def allow_deletion!
    @allow_deletion = true
  end
  ## 
   # Permite deleção de credenciamento por um administrador ou caso metodo 'allow_deletion!' tenha sido chamado pela instancia
  def check_permission
    throw(:abort) unless @allow_deletion || current_user_is_admin
  end
end
