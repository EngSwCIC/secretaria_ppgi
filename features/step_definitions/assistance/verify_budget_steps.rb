#-------------------- Contexto --#
Dado("que eu esteja cadastrado como administrador, com o email {email} e a senha {password}") do |email, password|
  pending
end
 
E("que eu esteja autenticado com o email {email} e a senha {password}") do |email, password|
  pending
end

E("que esteja na pagina inicial") do
  pending
end

E("que eu clique no botão Verificar Orçamento") do
  pending
end

#-------------------- Cenário feliz --#
Dado("que a página é carregada corretamente") do
  pending
end

E("que eu tenha {value} de orçamento disponível") do |value|
  pending
end
 
Então("o valor {value} é exibido") do |value|
  pending
end

#-------------------- Cenário triste --#
E("um valor diferente de {value} é exibido") do |value|
  pending
end

Então("uma mensagem de erro deve ser exibida") do
  pending
end