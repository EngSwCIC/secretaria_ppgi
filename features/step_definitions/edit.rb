require 'rubygems'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require "chromedriver-helper"

Dado("que acesso o banco e tem-se  informações disponíveis") do
    visit 'http://localhost:3000/attendances/1/edit' # entra na pagina de edicao do primeiro registro
  end
  
  Quando("deseja-se alterar qualquer titulo de um dado para {string}") do |titulo|
    find('#attendance_title').set titulo # insere um novo dado no campo Titulo, para a edicao
    click_button 'Salvar' # Clica no botao Salvar, para armazenar as alteraçoes
  end
  
  Entao("deve Editar com sucesso e apresentar {string}") do |mensagem|
    expect(page).to have_content mensagem # receber a mensagem Attendance was successfully update.
    sleep 3
  end
  

  # Sad path -> falha ao atualizar um arquivo, pois já está em uso
  Dado("que conecta-se ao banco") do
    visit 'http://localhost:3000/attendances/2/edit' # entra na pagina de edicao do segundo registro
  end
  
  Quando("alterar um dado para um titulo já existente, como titulo {string}") do |titulo|
    find('#attendance_title').set titulo # insere um novo dado no campo Titulo, para a edicao
    click_button 'Salvar' # Clica no botao Salvar, para armazenar as alteraçoes
  end
  
  Entao("deve falhar e mostrar {string}") do |mensagem|
    expect(page).to have_content mensagem # receber a mensagem Já está em uso
    sleep 3
  end
  

  # Teste de postar comentários
  
  Dado("que um registro é acessado para inclusão de comentários") do
    visit 'http://localhost:3000/attendances/1' # entra na pagina de Mostrar detalhes do primeiro registro
  end
  
  Quando("insere-se o comentário {string}") do |comentario|
    @comentario = comentario
    find('#comment_content').set comentario # insere o comentário
    click_button 'Postar comentário' # Clica no botao Postar, para armazenar o comentario
  end
  
  Entao("deve ser possível visualizar o comentário postado") do
    expect(page).to have_content @comentario # receber a mensagem Já está em uso
    sleep 3
  end