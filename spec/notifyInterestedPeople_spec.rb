require 'rails_helper'

RSpec.describe ".notifyInterestedPeople" do
    let(:uri) {'/Atividades'}
    
    context "Notificar pessoas interessadas" do
        let(:admin) {Activite.selectInterestedPeople("Estudantes")}

        it "Mostrar mensagem" do
            page.driver.get uri
			except(page.status_code).to be 200
            is_expected.to have "Notificação enviada aos interessados com sucesso"
        end
    end

    context "Página não encontrada" do
        it {is_expected.to equal 404}
    end
end
