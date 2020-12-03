#-------------------- Contexto --#
Dado("que eu esteja cadastrado como administrador para definir requisitos de solicitações, com o email {string} e a senha {string}") do |email, password|
  @email = email
  @password = password
  valid_email = @email.eql? "admin@admin.com"
  valid_psswd = @password.eql? "123456"
  valid_user = valid_email && valid_psswd
  expect(valid_user).to be true
end

E("que eu esteja autenticado com o email {string} e a senha {string} 1") do |email, password|
  visit '/users/sign_in'
  fill_in 'user_email', :with => 'admin@admin.com'
  fill_in 'user_password', :with => 'admin123'
  click_button "Log in"
end

E("que esteja na pagina inicial 1") do
  expect(page).to have_text("Usuário atual")
end

E("que eu clique no botão Editar requisitos de solicitação") do
  visit('/requirements/new')
end

#-------------------- Cenário feliz --#

Dado("que eu insira o requisito {string}") do |requirement|
  expect(page).to have_selector('#requirement_text', visible: true)

  fill_in 'requirement_text', :with => requirement

  expect(page).to have_field("requirement_text", with: requirement)
end

E("que eu clique no botão de Definir requisitos") do
  click_button "Definir requisitos"
end 

Então("os requisitos são atualizados com o valor {string}") do |requirements|
  @requirements = Requirement.all

  expect(@requirements.count).to eq 1
  expect(@requirements[0].requirements).to eq(requirements)
end

#-------------------- Cenário triste --#
Dado("que eu remova os requisitos existentes") do
  requirement = ""
  find("#requirement_text").set requirement
end

E("clique no botão Definir requisitos") do
  click_button "Definir requisitos"
end

Então("uma mensagem de erro é exibida") do
  expect(page).to have_text("Ocorreu um erro ao salvar os requisitos.")
end