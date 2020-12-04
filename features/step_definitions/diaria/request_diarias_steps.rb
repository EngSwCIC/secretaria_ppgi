Dado('que eu esteja cadastrado como usuario {string}') do |email|
  @email = email
  teste = email.eql? "student@student.com"
  expect(teste).to be true
end
  
Dado('que eu esteja autenticado com o email {string} e a senha {string} 2') do |email, password|
  visit '/users/sign_in'
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  click_button "Log in"
end

Dado('que esteja na pagina inicial 2') do
  expect(page).to have_text("Usuário atual")
end

Dado('eu clicar no botão Solicitar diárias') do
  click_button("Solicitar diárias")
end

Dado('eu insira data de entrada {string}') do |date|
  fill_in 'data_entrada', :with => date
  expect(page).to have_field('data_entrada', with: date)
end

Dado('eu insira data de saida {string}') do |date|
  fill_in 'data_saida', :with => date
  expect(page).to have_field('data_saida', with: date)
end

Então('eu devo estar em uma página de confirmação com a tabela:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable

  # | type            |    data    |  
  # | data de entrada | dd/mm/aaaa |
  # | data de saída   | dd/mm/aaaa |

  data = table.hashes
  type = []
  data = []

  data.each do |row|
    row.each do |key, value|
      if key.eql? "type"
        type << value
      elsif key.eql? "data"
        data << value
      end
    end
  end
  # a ser implementado
  has_table = page.has_css?("#table")
  find("#table")
  valid_table = is_equal(find("#table"), type, data)
  valid = has_table && valid_table
  expect(valid).to be true
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