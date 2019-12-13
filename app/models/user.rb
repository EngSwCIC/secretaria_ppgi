##
# Classe que representa o usuário que irá utilizar o sistema.

class User < ApplicationRecord
  ##
  # Essa classe é composta por full_name, que é o nome inteiro do usuário,
  # e role, que é o tipo do usuário, podendo ser ele um estudante, professor,
  # secretário ou administrador.

  validates :full_name, presence: true
  validates :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[administrator secretary professor student]
end
