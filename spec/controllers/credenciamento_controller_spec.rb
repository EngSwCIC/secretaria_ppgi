require 'rails_helper'

RSpec.describe CredenciamentoController, type: :controller do

describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe Credenciamento do 
    it "Criação do credenciamento" do 
        credenciamento = Credenciamento.create(iduser: 1)
        expect(credenciamento.iduser).to eq(1) # esperamos que seja salvo com o id=1
    end 
   end

   describe Periodo_Credenciamento do 
    it "Criação do periodo de credenciamento" do 
        periodo = Periodo_Credenciamento.create(comeco: '2019-05-12',fim: '2019-05-13',idadmin: 1)
        expect(periodo.idadmin).to eq(1) # esperamos que seja salvo com o id=1
        expect(periodo.comeco).to eq('2019-05-12') # esperamos que seja salvo com o id=1
    end 
   end

    describe Periodo_Credenciamento do 
        it "Criação do periodo de credenciamento" do 
            periodo = Periodo_Credenciamento.create(comeco: '2019-05-12',fim: '2019-05-13',idadmin: 1)
            expect(periodo.idadmin).to eq(1) # esperamos que seja salvo com o id=1
            expect(periodo.comeco).to eq('2019-05-12') 
        end 
    end
   

    describe Credenciamento do 
        it "O valor alterado deve corresponder" do 
            @credencial = Credenciamento.find(1)
            @credencial.aproved = false
            @credencial.rejected = false
            @credencial.save
            expect(@credencial.aproved).to eq(false) # esperamos que seja resetado
            expect(@credencial.rejected).to eq(false)

        end 
    end

    describe Credenciamento do 
        it "Aproved" do 
            @credencial = Credenciamento.find(1)
            @credencial.aproved = true
            @credencial.rejected = false
            @credencial.save
            expect(@credencial.aproved).to eq(true) # esperamos que seja aprovado
            expect(@credencial.rejected).to eq(false)

        end 
    end

    describe Credenciamento do 
        it "Rejected" do 
            @credencial = Credenciamento.find(1)
            @credencial.aproved = false
            @credencial.rejected = true
            @credencial.save
            expect(@credencial.aproved).to eq(false)
            expect(@credencial.rejected).to eq(true) # esperamos que seja rejeitado

        end 
    end

end
