#-------------------- Contexto --#
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

E /^Eu esteja autenticado como administrador do
  @admin = Admin.find_by_email('admin@admin.com')
end

E /^Eu esteja na (.+)$/ do |root_path|
  visit path_to(root_path)
end

Quando /^Eu clico em ([^"]*)"$/ do |button|
  click_button(button)
end

#-------------------- Cenário feliz --#
Então /^Eu devo estar na página (.+)$/ do |budget_index|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(budget_index)
  else
    assert_equal path_to(prazos_index), current_path
  end
end
 
Então /^Eu devo ver ([^"]*)"$/ do |value|
  if page.respond_to? :should
    page.should have_content(value)
  else
    assert page.has_content?(value)
  end
end
