Dado("que eu esteja cadastrado como administrador, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}") do |Name, Email, Pasword, Role, Registration|
  pending
end

E("que eu esteja autenticado como {Role}") do |Role|
  pending
end

E("que eu esteja na página inicial") do
  visit(root_path)
end

E("eu clicar no botão {string}") do |string|
  pending
end

Caso("a página de definir um prazo seja carregada corretamente") do
  pending
end

E("exista um botão com a opção de {string} para que eu possa escolher um período") do |string|
  pending
end

Então("eu devo estar em uma página com uma tabela com os dados:") do
  pending
end 
