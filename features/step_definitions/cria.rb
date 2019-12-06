require 'rubygems'
require 'selenium-webdriver'


#
driver = Selenium::WebDriver.for :chrome

Dado("que acesso o banco e tem-se  informações a inserir") do
    driver.navigate.to "http://localhost:3000/attendances/new" # abre a pagina de insercao de dados
  end
  
  Quando("insere-se {string} e {string}") do |string, string2|
    @string = string
    driver.find_element(:id , 'attendance_title').send_keys string # insere titulo    
    driver.find_element(:id , 'attendance_content').send_keys string2 # insere conteudo
    driver.find_element(:name , 'commit').click # clica no botao cadastrar
    #sleep 10
  end
  
  Entao("deve inserir com sucesso os dados no banco") do
    
  end
  
  Entao("receber a seguinte mensagem {string}") do |string|
    
    driver.navigate.to "http://localhost:3000/attendances/38"
    driver.find_element(:id , 'notice') # Procura a mensagem esperada de insercao bem sucedida
    sleep 2
    
    
  end
  