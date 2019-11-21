class Setup < ApplicationRecord
  validates :inicio, presence: true
  validates :fim, presence: true
end
