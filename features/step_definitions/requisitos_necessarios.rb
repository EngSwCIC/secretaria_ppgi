Dado("que eu esteja logado como administrador de email {string} e senha {string}") do |email, senha|
  User.create(username: 'admin', email: email, password: senha,
  registration: "123456789", is_admin: true
  )
  visit new_user_session_path
  fill_in :user_email, with: email
  fill_in :user_password, with: senha
  click_button "Log in"
end

Quando("o administrador clicou no link para alterar documentos necessários para credenciamento") do
  pending visit alterar_requisitos_path
end

Quando("eu selecionar os campos") do
  # select = page.find('select#select_id')
  # select.select 'Opção 1'
  # select.select 'Opção 2'
  # select.select 'Opção 3'
end

E("eu clicar no botão atualizar requisitos") do
  pending click_button "atualizar requisitos"
end

Então("eu devo voltar para a página principal aonde aparece meus requisitos selecionados") do
  pending page.hasText('opções atuais: Option 1, Option 2, Option 3');
end

Então("eu recebo uma mensagem dizendo que {string}") do |string|
  pending @expected_message = string
end
