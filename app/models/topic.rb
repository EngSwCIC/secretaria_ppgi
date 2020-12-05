class Topic < ApplicationRecord
  validates :titulo, presence: true
  has_many :Faqs
  has_many :FaqsSuggestions
end
