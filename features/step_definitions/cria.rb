require 'rubygems'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require "chromedriver-helper"


#
driver = Selenium::WebDriver.for :chrome

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
  


# Sad path

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