require 'rails_helper'
require 'capybara/rails'

RSpec.describe ProcessosController, type: :controller do
  before(:each) do
    @secretario = User.new(email: 'teste@teste.com', password: '123456', is_secretary:true)
    @secretario.save!
    sign_in @secretario
  end

  describe 'POST #create' do
    it 'adicionar um comentário' do
      @processo = Processo.find(1)
      @comentario = Comentario.create(id: 1, id_process: 1, text:'Acompanhando o Processo')
      @comentario.should be_an_instante_of Comentario
    end
  end
end