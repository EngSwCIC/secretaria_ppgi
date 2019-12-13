##
# = Model da Classe Source, resposavel por fontes de informaçoes 
class Source < ApplicationRecord
  has_many :notification
end
