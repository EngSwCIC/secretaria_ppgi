class Diaria < ApplicationRecord
    validate :validacao, on: [:create]
    
    require 'date'
    def valid_date?( str, format="%d/%m/%Y" )
      puts(str)
      Date.strptime(str,format) rescue false
    end

    def validacao
        if valid_date?(data_entrada) == false or valid_date?(data_saida) == false
            error.add("formato de data inválido")
        end
  
    end


    validate :validacao(self.data_saida), on: [:create]
end
