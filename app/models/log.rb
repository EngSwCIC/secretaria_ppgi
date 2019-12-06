class Log < ApplicationRecord
  belongs_to :budget

  validates :value, presence: true
  validates :description, presence: true
end
