require 'rails_helper'

RSpec.describe 'InformationControler' do
    describe 'viewing available information by source'do
        it 'from all sources'do
            click_link('Informações')
            collection_select('Selecione uma fonte')
            click_link('Filtrar')
            expect(page).to have_content('Todas Infomações')
        end

        it 'from specific source' do
            click_link('Informações')
            collection_select('Fonte 01')
            click_link('Filtrar')
            expect(page).to have_content('Informação 01')
        end

        it 'and the source has no info yet' do
            click_link('Informações')
            collection_select('Todas')
            click_link('Filtrar')
            expect(page).to have_content('Nenhuma Informação publicada pela fonte selecionada!')    
        end
    end
end