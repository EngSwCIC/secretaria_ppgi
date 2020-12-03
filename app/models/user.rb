# frozen_string_literal: true
##
# Essa classe valida os campos para a tabela de usuário do banco de dados
class User < ApplicationRecord
  validates :full_name, presence: true
  validates :role, presence: true

  ##
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[administrator secretary professor student]
end
