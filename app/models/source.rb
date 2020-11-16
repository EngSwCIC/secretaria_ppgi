class Source < ApplicationRecord
	validates :name, presence: true
	validates :name, uniqueness: true
    has_many :information, dependent: :destroy
end
