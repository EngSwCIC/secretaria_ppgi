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

E("que eu clique no botão de edição de requisitos de solitação de auxílio") do
  pending
end

#-------------------- Cenário feliz --#
Dado("que a página é carregada corretamente") do
  pending
end

E("que eu insira o requisito {requirement}") do |requirement|
  pending
end

E("clique no botão de confirmação de edição") do
  pending
end

Então("os requisitos são atualizados") do
  pending
end

#-------------------- Cenário triste --#
E("que eu remova os requisitos existentes") do
  pending
end

E("clique no botão de confirmação de edição") do
  pending
end

Então("uma mensagem de erro, é exibida, indicando que os requisitos não podem ficar em branco") do
  pending
end