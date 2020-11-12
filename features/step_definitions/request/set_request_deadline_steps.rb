Dado /^Eu esteja cadastrado como administrador, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}$/ do |Name, Email, Pasword, Role, Registration|
  @adm = {
    Name: 'Administrador',
    Email: 'admin@admin.com',
    Password: 'admin123',
    Role: "admin",
    Registration: "000000000"
  }
  Admin.create!(@adm)
end

<<<<<<< HEAD:features/step_definitions/SetDeadlines/SetDeadlines_step.rb
E /^Eu esteja autenticado como administrador do
  @admin = Admin.find_by_email('admin@admin.com')
=======
E("que eu esteja autenticado como {Role}") do |Role|
  pending
>>>>>>> 5044e93d19db1008a953901c47b1d57c29330e2f:features/step_definitions/request/set_request_deadline_steps.rb
end

E /^Eu esteja na (.+)$/ do |root_path|
  visit path_to(root_path)
end

Quando /^Eu clico em ([^"]*)"$/ do |button|
  click_button(button)
end

<<<<<<< HEAD:features/step_definitions/SetDeadlines/SetDeadlines_step.rb
Então /^Eu devo estar na página (.+)$/ do |prazos_index|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(prazos_index)
  else
    assert_equal path_to(prazos_index), current_path
  end
end

Quando /^Eu clico em ([^"]*)"$/ do |button|
  click_button(button)
end

E /^Eu preencho "([^"]*)" com "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end 

Quando /^Eu aperto enter no teclado$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.click('Ok')
end

Então /^Eu devo ver ([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
=======
Caso("a página de definir um prazo seja carregada corretamente") do
  pending
end

E("exista um botão com a opção de {string} para que eu possa escolher um período") do |string|
  pending
end

Então("eu devo estar em uma página com uma tabela com os dados:") do
  pending
end 
>>>>>>> 5044e93d19db1008a953901c47b1d57c29330e2f:features/step_definitions/request/set_request_deadline_steps.rb
