# Dado("que eu esteja cadastrado como administrador, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}") do |Name, Email, Pasword, Role, Registration|
#     pending
# end

# E("que eu esteja autenticado como {Role}") do |Role|
#     pending
# end

# E("que eu esteja na página inicial") do
#     visit(root_path)
# end

# E("eu clicar no link do painel de administrador") do
#     pending
# end

# E("eu clicar em na lista de solicitações") do
#     pending
# end

# Então("eu devo estar em uma página com uma tabela mostrando os dados ordenados") do
#     pending
# end

  Dado('que eu esteja cadastrado como administrador com email {string}') do |email|
    @email = email
    valid_email = email.eql? "admin@admin.com"
    expect(valid_email).to be true
  end
  
  E('que esteja autenticado como {string}') do |role|
    valid_role = role.eql? "admin"
    expect(valid_role).to be true
  end
  
  E('eu clicar no link do painel de administrador') do
    find_link("admin_panel").click
  end
  
  E('eu clicar em na lista de solicitações') do
    find_link("request_list").click
  end
  
  Dado('que Lista de Solicitações aparece adequadamente') do
    find("#lista")
  end

  E('exista a Solicitação {string}') do |model|
    find_link(model)
    find(model)
    # expect(page).to have(model)
  end
  
  Então('eu devo estar em uma página com uma tabela mostrando os dados ordenados') do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    pending # Write code here that turns the phrase above into concrete actions
  end