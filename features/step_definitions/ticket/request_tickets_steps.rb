Dado("que eu esteja cadastrado como usuario, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}") do |Name, Email, Pasword, Role, Registration|
  pending
end

E("que eu esteja autenticado com a role: {Role}") do |Role|
  pending
end

E("que eu esteja na página inicial") do
  visit(root_path)
end

E("eu clicar no botão {string}") do |string|
  pending
end

E("eu esteja na página de solicitação de passagens") do |passagens_index_path|
  pending
end

E("deve haver um botão com a opção de {string} para que eu possa fazer uma solicitação") do |string|
  pending
end

Então("eu devo conseguir vizualizar a tabela com nome e período da solicitação que desejo fazer") do |passagens_index_path|
  pending
end 