Dado("que eu esteja logado como secretario {string}, {string},") do |string, string2|
  User.create(email:'usuario_secretario@secretario.com', password: "123456", is_secretary: true)

  visit new_user_session_path
  fill_in :user_email, with: string
  fill_in :user_password, with: string
  click_button "Entrar"
end

Dado("que eu estou na página de atendimento da Wiki") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando("eu clicar {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então("eu devo estar na pagina Criar Novo processo") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando("eu preencher {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando("eu clicar em {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então("eu devo estar na página de atendimento") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então("eu devo ver a mensagem {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  