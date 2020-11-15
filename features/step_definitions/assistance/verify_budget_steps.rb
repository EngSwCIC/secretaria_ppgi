# #-------------------- Contexto --#
# Dado("que eu esteja cadastrado como administrador, com o email {email} e a senha {password}") do |email, password|
#   pending
# end
 
# E("que eu esteja autenticado com o email {email} e a senha {password}") do |email, password|
#   pending
# end

# E("que esteja na pagina inicial") do
#   pending
# end

# E("que eu clique no botão Verificar Orçamento") do
#   pending
# end

# #-------------------- Cenário feliz --#
# Dado("que a página é carregada corretamente") do
#   pending
# end

# E("que eu tenha {value} de orçamento disponível") do |value|
#   pending
# end
 
# Então("o valor {value} é exibido") do |value|
#   pending
# end

# #-------------------- Cenário triste --#
# E("um valor diferente de {value} é exibido") do |value|
#   pending
# end

# Então("uma mensagem de erro deve ser exibida") do
#   pending
# end


Dado('que eu clique no botão Verificar Orçamento') do    
    click_button("#verify_budget")
  end
  
  E('que eu tenha {float} de orçamento disponível') do |budget|
    orcamento_disp = budget > 0
    expect(orcamento_disp).to be true
  end
  
  Então('o valor {float} é exibido') do |float|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Dado('um valor diferente de {float} é exibido') do |float|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('uma mensagem de erro deve ser exibida.') do
    pending # Write code here that turns the phrase above into concrete actions
  end