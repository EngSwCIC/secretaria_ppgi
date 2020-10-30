require 'rails_helper'

RSpec.describe ".addPersonOnActivite" do
	let(:uri) {'/Atividades'}

	context "Adicionar pessoa em atividade" do
		let(:person) {Activite.addPerson("Teste", "teste@teste")}

		it "Mostra menssagem" do
			page.driver.get uri
			except(page.status_code).to be 200
			is_expected.to have "Pessoa adicionada com sucesso"
		end
	end

	context "Quando não encontrado" do
		it {is_expected.to equal 404}
	end
end