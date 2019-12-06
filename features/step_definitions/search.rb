require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

Dado("que acesso o banco e tem-se  informações a buscar") do
    driver.navigate.to "http://localhost:3000/attendances"
  end
  
  Quando("digita-se na barra de Busca o dado {string}") do |string|
   @string = string
   driver.find_element(:id , 'search').send_keys string # insere titulo na barra de busca
   driver.find_element(:name , 'button').click # clica no botao Pesquisar

  end
  
  Entao("deve encontrar com sucesso") do #redireciona para a pagina de todas as buscas encontradas
    driver.navigate.to "http://localhost:3000/search?utf8=%E2%9C%93&search=funcio&button="
    
  end
  
  Entao("ser capaz de identificar todos os resultados possíveis da busca") do
    sleep 5
  end