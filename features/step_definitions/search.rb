require 'rubygems'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require "chromedriver-helper"

Dado("que acesso o banco e tem-se  informações a buscar") do
  visit 'http://localhost:3000/attendances'
end

Quando("digita-se na barra de Busca o dado {string}") do |titulo|
  @titulo = titulo #variavel de instância que fica disponível pra todo cenário
  find('#search').set titulo # coloca na barra de busca o titulo a pesquisar
  click_button 'Pesquisar' # clica no botao
end

Entao("deve encontrar com sucesso") do #redireciona para a pagina de todas as buscas encontradas
  expect(page).to have_content @titulo # espera-se que na pagina mostre o titulo buscado
end

Entao("ser capaz de identificar todos os resultados possíveis da busca") do
  sleep 3
end

# Sad path -> Tentativa de buscar um Dado que não existe no Banco

Dado("que acesse a pagina principal") do
  visit 'http://localhost:3000/attendances'
end

Quando("busca-se o titulo {string}") do |titulo|
  find('#search').set titulo # coloca na barra de busca o titulo a pesquisar
  click_button 'Pesquisar' # clica no botao
end

Então("deve apresentar a mensagem {string}") do |mensagem|
  expect(page).to have_content mensagem # Deve apresentar na tela "Nenhuma wiki encontrada"
  sleep 3
end