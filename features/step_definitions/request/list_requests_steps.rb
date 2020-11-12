Dado("que eu esteja cadastrado como administrador, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}") do |Name, Email, Pasword, Role, Registration|
    pending
end

E("que eu esteja autenticado como {Role}") do |Role|
    pending
end

E("que eu esteja na página inicial") do
    visit(root_path)
end

E("eu clicar no link do painel de administrador") do
    pending
end

E("eu clicar em na lista de solicitações") do
    pending
end

Então("eu devo estar em uma página com uma tabela mostrando os dados ordenados") do
    pending
end