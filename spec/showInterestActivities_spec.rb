require 'rails_helper'

RSpec.describe ".showInterestActivities" do
	let(:uri) {'/Atividades'}

	context "Mostrar atividades de interesse" do
		let(:user) {Activite.showInterestActivities("Atividades")}

		it "Mostra mensagem" do
			page.driver.get uri
			except(page.status_code).to be 200
			is_expected.to have "localhost:3000/Atividades"
		end
  end

	context "Página não encontrada" do
		it {is_expected.to equal 404}
	end
end
