##
# = Model da Classe Base da aplicaçao
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
