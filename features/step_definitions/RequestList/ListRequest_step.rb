Dado("que eu esteja cadastrado como administrador, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}") do |Name, Email, Pasword, Role, Registration|
    pending
end

E("que eu esteja autenticado com a role: {Role}") do |Role|
    pending
end

E("que eu esteja na página inicial") do
    visit(root_path)
end

E("eu clicar no link Painel de Administrador") do |admin_root_path|
    pending
end

E("eu clicar em Lista de Solicitações") do |solicitacao_index_path|
    pending
end

Então("eu devo conseguir vizualizar a tabela de solicitações ordenadas por prioridade") do |solicitacao_index_path|
    pending
end