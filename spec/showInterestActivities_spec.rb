require 'rails_helper'

RSpec.describe ".showInterestActivities" do
	let(:uri) {'/Calendar'}

	context "Mostrar atividades de interesse" do
		let(:activities) {showInterestActivities}

		it "Mostra menssagem" do
			page.driver.get uri
			except(page.status_code).to be 200
			is_expected.to have "localhost:3000/Calendar"
		end
	end
end
