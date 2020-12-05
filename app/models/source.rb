##
 # Model da classe Source
 # Exige que a fonte de informação tenha um nome e que esse nome seja único.
 # Cada fonte pode possuir muitas informações.
class Source < ApplicationRecord
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many :informations
end
