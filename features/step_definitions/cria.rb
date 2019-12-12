require 'rubygems'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require "chromedriver-helper"



driver = Selenium::WebDriver.for :chrome
# happy path
Dado("que acesso o banco e tem-se  informações a inserir") do
   visit 'http://localhost:3000/attendances/new'
   
  end
  
  Quando("insere-se {string} e {string}") do |titulo, conteudo|
    find('#attendance_title').set titulo # insere o dado no campo Titulo
    find('#attendance_content').set conteudo # insere o dado no campo content
    click_button 'Cadastrar' # Clica no botao cadastrar
  end
  
  Entao("deve inserir com sucesso os dados no banco") do
    
  end
  
  Entao("receber a seguinte mensagem {string}") do |mensagem|
    expect(page).to have_content mensagem # receber a mensagem Attendance was successfully created.
    sleep 3
  end
  


# Sad path -> Tentativa de criar um título já existente no banco

Dado ("que acesso a pagina principal") do
  visit 'http://localhost:3000/attendances/new'
end

Quando("insere-se um titulo já existente {string}") do |titulo|
    find('#attendance_title').set titulo # insere um titulo ja existente
    click_button 'Cadastrar'
end

Entao("deve aparecer a mensagem {string}") do |mensagem|
  expect(page).to have_content mensagem # receber a mensagem Já está em uso
  sleep 3
end 


# Teste de anexo de arquivos


Dado ("que cria um novo registro com os campos {string} e {string}") do |titulo , conteudo|
  visit 'http://localhost:3000/attendances/new' # abre a pagina de insercao de novos dados no banco
  find('#attendance_title').set titulo # insere o dado no campo Titulo
  find('#attendance_content').set conteudo # insere o dado no campo content
end

Quando("anexa um arquivo com o nome {string}") do |nome_arquivo|
  @nome_arquivo = nome_arquivo # instância da variável,permitindo utilizar em todo cenário
  #clica no botão escolher arquivo e seleciona o arquivo neste diretorio a seguir
  attach_file('attendance[files]', Rails.root + "app/assets/file/cal3na_30.pdf" , visible: false)
  click_button 'Cadastrar' # clica no botão cadastrar
  sleep 2
end

Entao("deve criar com sucesso o registro e visualizar o arquivo anexado") do 
  expect(page).to have_content @nome_arquivo # Procura na página o nome do arquivo anexado
  sleep 3
end 