require 'rubygems'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require "chromedriver-helper"

Dado("que possue informações no banco") do
    visit 'http://localhost:3000/attendances'
  end
  
  Quando("ocorrer uma exclusão de algum dado existente") do
    # Encontra o botão de excluir do elemento que no caso é o segundo registro no banco
    find(:xpath, "//a[@href='/attendances/2' and @data-method='delete' ]").click 
    # Confirma a ação de excluir o dado do banco, apertando em ok no balao "Are you sure?"
    page.driver.browser.switch_to.alert.accept 
  end
  
  Entao("deve remover com sucesso os dados") do
    
  end
  
  Entao("deve ser apresentado a seguinte mensagem para o usuario {string}") do |mensagem|
    expect(page).to have_content mensagem # receber a mensagem Attendance was successfully destroyed.
    sleep 3
  end