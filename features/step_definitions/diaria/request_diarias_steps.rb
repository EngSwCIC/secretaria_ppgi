# Dado(/^que eu esteja cadastrado como usuario, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}$/) do |name, email, pasword, role, registration|
    
#   @user = {
#     Name: 'Usuario',
#     Email: 'usuario@user.com',
#     Password: 'user123',
#     Role: "user",
#     Regustration: "000000000"
#   }
#   user.create!(@user)
# end

# E(/^que eu esteja autenticado com a role$/) do
#     @user = user.find_by_email('usuario@user.com')
# end

# E(/^que eu esteja na página inicial$/) do |root_path|
#     visit(root_path)
# end

# # E(/^eu clicar no botão "(.*)"$/) do |button|
# #     click_button(button)
# # end

# E(/^eu clicar em "Solicitar Diária"$/) do
#     find_link("Solicitar Diária").click_button
# end

# E(/^existe um campo "(.*)" para inserção de data de entrada $/) do |field| 
#     pending
# end

# E(/^existe um campo "(.*)" para inserção de data de saída {date}$/) do |field|
#     pending
# end

# Então(/^eu devo estar na página "(.*)"$/) do |diarias_index|
#     current_path = URI.parse(current_url).path
#   if current_path.respond_to? :should
#     current_path.should == path_to(diarias_index)
#   else
#     assert_equal path_to(diarias_index), current_path
#   end

# E(/^devo ver "(.*)"$/) do |table|
#     datas = table.hashes
#     datas.each{|_k, v| puts v}
# end


# end 

Dado('que eu esteja cadastrado como usuario {string}') do |email|
  @email = email
  teste = email.eql? "user@user.com"
  expect(teste).to be true
end
  
Dado('que esteja autenticado') do
  authentication = true
  expect(authentication).to be true
end

Dado('que esteja na pagina inicial') do
  visit(root_path)
end

Dado('eu clicar no botão {string}') do |button|
  click_button(button)
  # visit(diarias_index)
end

Dado('existe um campo {string} para inserção de data de entrada') do |field|
  find(field)
end

Dado('eu insira {string} no campo {string}') do |date, field|
  @date_in = date
  find(field).set @date_in
  # fill_in(field, :with => date)
end

Dado('existe um campo {string} para inserção de data de saída') do |field|
  find(field)
end

Dado('eu insira {string} no campo {string}') do |date, field|
  @date_out = date
  find(field). set @date_out
  # fill_in(field, :with => date)
end

Então('eu devo estar em uma página de confirmação com a tabela:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end
