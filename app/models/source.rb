class Source < ApplicationRecord
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many :informations
end
