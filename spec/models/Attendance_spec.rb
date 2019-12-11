require 'rails_helper'
#
#
# testes que permitem que a estrutura do banco estejam corretas
	RSpec.feature Attendance , type: :model do

		context 'validation tests' do
			it "return the correct name of title" do 
   				 at = Attendance.new(title: "Funcionario")
   				 expect(at.title).to eq("Funcionario") 
			end
			# create salva no banco
			it "return the correct name of content" do
				at = Attendance.create(title: "Rede" , content: "conexao")
				expect(at.content).to eq("conexao")
			end

		end
		# Teste de edicao no banco de dados
        context 'when data exists' do
            it "edit of the title was successfully" do
				at = Attendance.create(title: "Rede" , content: "conexao")
				at.update(title: "novo titulo")
				expect(at.title).to eq("novo titulo")
			end

			it "edit of the content was successfully " do
				at = Attendance.create(title: "Rede" , content: "conexao")
				at.update(content: "conexao reporter")
				expect(at.content).to eq("conexao reporter")
			end

			it "edit of the title and content was successfully " do
				at = Attendance.create(title: "Rede" , content: "conexao")
				at.update(title: "funcionario" ,content: "proativo")
				expect(at.title).to eq("funcionario")
				expect(at.content).to eq("proativo")
			end
		end
	end
