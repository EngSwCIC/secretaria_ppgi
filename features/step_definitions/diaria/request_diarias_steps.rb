Dado("que eu esteja cadastrado como usuario, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}") do |Name, Email, Pasword, Role, Registration|
    pending
end

E("que eu esteja autenticado com a role: {Role}") do |Role|
    pending
end

E("que eu esteja na página inicial") do
    visit(root_path)
end

E("eu clicar no botão 'Solicitar diárias'") do |diarias_index_path|
    pending
end

E("deve haver um campo para inserção da data de entrada {date} ") do |date| 
    pending
end

E("deve haver um campo para inserção da data de saída {date}") do |date|
    pending
end

Então("eu devo conseguir vizualizar uma tabela com as datas de entrada e saída da solicitação que desejo fazer") do |diarias_index_path|
    pending
end 