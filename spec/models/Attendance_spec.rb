require 'rails_helper'
#
#
# testes que permitem que a estrutura do banco estejam corretas
	RSpec.feature Attendance , type: :model do
		context 'validation tests' do
			it 'ensures title presence' do
				at = Attendance.new(content: 'casa legal').save
				expect(at).to eq(false) 
			end
		
			# new gera instancia do attendance sem salvar no Banco
			it 'ensures content presence' do
				at = Attendance.new(title:'filme').save
				expect(at).to eq(false) 
			end
			it 'should save successfully' do
				at = Attendance.new(title:'duro de matar' , content:'acao' ).save
				expect(at).to eq(true) 
			end

			  it "return the correct name of title" do # sim, você pode user 'it' (lê-se como 'isso tem um nome')
   				 at = Attendance.new(title: "Funcionario") # criando uma nova titulo
   				 expect(at.title).to eq("Funcionario") # 
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
		# exclusao de dados
		context 'when datas exists' do
			it "destroy of the data was successfully " do
				at = Attendance.create(title: "casa" , content: "boa")
				at.destroy
				expect(at.title).to eq("casa")

		# Teste sobre busca de dados no banco de dados

		context "files attachment" do
			it "creates a attendance with a file" do
				attendance = create(:Attendance)
				# how to create this file?
				attendance.files.attach(create_file_blob) 
				expect(attendance.files.any?).to eq(true)
			end
			
		end
		
	end

