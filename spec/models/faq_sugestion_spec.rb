require 'rails_helper'

RSpec.describe FaqSugestion, type: :model do
  describe 'validation tests' do
    it 'ensure presence of topico' do
      faq_sugestion = FaqSugestion.new(pergunta:'pergunta', resposta: 'resposta').save
      expect(faq_sugestion).to eq(false)
    end
    it 'ensure presence of pergunta' do
      faq_sugestion = FaqSugestion.new(topico:'topico', resposta: 'resposta').save
      expect(faq_sugestion).to eq(false)
    end
    it 'ensure presence of resposta' do
      faq_sugestion = FaqSugestion.new(topico:'topico', pergunta:'pergunta').save
      expect(faq_sugestion).to eq(false)
    end
    it 'should save successfully' do
      faq_sugestion = FaqSugestion.new(topico:'topico', pergunta:'pergunta', resposta: 'resposta').save
      expect(faq_sugestion).to eq(true)
    end
  end
end
