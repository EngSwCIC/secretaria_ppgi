class Suggestion < ApplicationRecord
  validates :answer, presence: true
  validates :title, presence: true
  has_one :questionTopic, dependent: :destroy
  
end