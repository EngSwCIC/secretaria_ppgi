Quando(/(?:clico|clicar) no botão "([^"]*)"/) do |botao|
    click_button botao
end

Então(/recebo uma mensagem de (sucesso|erro)/) do |status|
    pending # Write code here that turns the phrase above into concrete actions
end

Quando(/não preencho o campo "([^"]*)"/) do |campo|
    pending # Write code here that turns the phrase above into concrete actions
end

Quando(/preencho o campo "([^"]*)" com "([^"]*)"/) do |campo, valor|
    fill_in campo, with: valor
end

Dado(/(?:esteja na|redirecionado para a) página "([^"]*)"/) do |pagina|
   pending
end

Dado(/esteja conectado como usuario "([^"]*)", "([^"]*)", "([^"]*)"/) do |usuario, senha, funcao|
    #faz login
 
    User.create(full_name: "Secretário", email: "secretary@secretary.com", password: "admin123", role: "secretary", registration: "000000000")
    visit new_user_session_path
    fill_in :user_email, with: usuario
    fill_in :user_password, with: senha
    click_button "Log in"

end 

Quando(/visualizar (?:o|a|os|as) "([^"]*)"/) do |elemento|
    pending
end

Quando(/seleciono (?:o|a|os|as) "([^"]*)" "([^"]*)"/) do |campo, valor|
    pending
end

Quando(/envio o arquivo "([^"]*)"/) do |arquivo|
    pending # Write code here that turns the phrase above into concrete actions
end
  