# Dado /^Eu esteja cadastrado como administrador, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}$/ do |Name, Email, Pasword, Role, Registration|
#   @adm = {
#     Name: 'Administrador',
#     Email: 'admin@admin.com',
#     Password: 'admin123',
#     Role: "admin",
#     Registration: "000000000"
#   }
#   Admin.create!(@adm)
# end

# E /^Eu esteja autenticado como administrador do
#   @admin = Admin.find_by_email('admin@admin.com')
# end

# E /^Eu esteja na (.+)$/ do |root_path|
#   visit path_to(root_path)
# end

# Quando /^Eu clico em ([^"]*)"$/ do |button|
#   click_button(button)
# end

# Então /^Eu devo estar na página (.+)$/ do |prazos_index|
#   current_path = URI.parse(current_url).path
#   if current_path.respond_to? :should
#     current_path.should == path_to(prazos_index)
#   else
#     assert_equal path_to(prazos_index), current_path
#   end
# end

# Quando /^Eu clico em ([^"]*)"$/ do |button|
#   click_button(button)
# end

# E /^Eu preencho "([^"]*)" com "([^"]*)"$/ do |field, value|
#   fill_in(field, :with => value)
# end 

# Quando /^Eu aperto enter no teclado$/ do
#   page.evaluate_script('window.confirm = function() { return true; }')
#   page.click('Ok')
# end

# Então /^Eu devo ver ([^"]*)"$/ do |text|
#   if page.respond_to? :should
#     page.should have_content(text)
#   else
#     assert page.has_content?(text)
#   end
# end

Dado('que eu esteja cadastrado como administrador com email {string}') do |email|
    @email = email
    valid_email = email.eql? "admin@admin.com"
    expect(email).to be true
  end
  
  E('que eu esteja autenticado') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  E('que eu esteja na pagina inicial') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Dado('deve haver um botão para escolher um período a ser definido') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('eu devo estar em uma página com uma tabela com os dados:') do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('eu preencho os dados') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('eu devo estar em uma página confirmando a solicitação') do
    pending # Write code here that turns the phrase above into concrete actions
  end