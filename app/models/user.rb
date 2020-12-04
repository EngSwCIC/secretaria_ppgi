# frozen_string_literal: true

class User < ApplicationRecord
  validates :full_name, presence: true
  validates :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[administrator secretary professor student]

  has_many :information
  has_many :user_notifications
  has_many :requests
end
