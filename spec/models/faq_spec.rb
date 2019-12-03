require 'rails_helper'

RSpec.describe Faq, type: :model do
  describe 'validation tests' do
    it 'ensure presence of topico' do
      faq = Faq.new(pergunta:'pergunta', resposta: 'resposta').save
      expect(faq).to eq(false)
    end
    it 'ensure presence of pergunta' do
      faq = Faq.new(topico:'topico', resposta: 'resposta').save
      expect(faq).to eq(false)
    end
    it 'ensure presence of resposta' do
      faq = Faq.new(topico:'topico', pergunta:'pergunta').save
      expect(faq).to eq(false)
    end
    it 'should save successfully' do
      faq = Faq.new(topico:'topico', pergunta:'pergunta', resposta: 'resposta').save
      expect(faq).to eq(true)
    end
  end
end
