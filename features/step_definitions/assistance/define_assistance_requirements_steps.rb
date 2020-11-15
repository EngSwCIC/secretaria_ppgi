#-------------------- Contexto --#
Dado("que eu esteja cadastrado como administrador, com o email {string} e a senha {string}") do |email, password|
  @email = email
  @password = password
  valid_email = @email.eql? "admin@admin.com"
  valid_psswd = @password.eql? "123456"
  valid_user = valid_email && valid_psswd
  expect(valid_user).to be true
end

E("que eu esteja autenticado com o email {string} e a senha {string}") do |email, password|
  auth = @email.eql? email
  auth2 = @password.eql? password
  authentication = auth && auth2
  expect(authentication).to be true
end

E("que esteja na pagina inicial") do
  visit(root_path)
end

E("que eu clique no botão de edição de requisitos de solitação de auxílio") do
  click_button("#edicao_requisitos")
end

#-------------------- Cenário feliz --#
Dado("que a página é carregada corretamente") do
  visit(requirement_page)
end

E("que eu insira o requisito {string}") do |requirement|
  find("#requisitos").set requirement
end

E("clique no botão de confirmação de edição") do
  click_button "confirmar edição"
end

Então("os requisitos são atualizados") do
  pending
end

#-------------------- Cenário triste --#
E("que eu remova os requisitos existentes") do
  requirement = ""
  find("#requisitos").set requirement
end

E("clique no botão de confirmação de edição") do
  click_button "confirmar edição"
end

Então("uma mensagem de erro, é exibida, indicando que os requisitos não podem ficar em branco") do
  alert = find("#error_msg")
  expect(alert).to be true
end