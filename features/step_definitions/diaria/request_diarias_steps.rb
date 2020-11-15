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

#----------------- cenario triste
Dado('que o usuário insere uma data inválida') do
  valid = true
  if invalid(@date_in) || invalid(@date_out)
    valid = false
  end 
  expect(valid).to be false
end

Então('eu devo ver uma mensagem de erro') do
  find("#error_msg")
end