Dado("que eu esteja cadastrado como usuario com email {string}") do |email|
    @email = email
    valid_email = email.eql? "user@user.com"
    expect(valid_email).to be true
end

E("que eu esteja autenticado como usuario") do
#   authenticate(user)
    valid_email = @email.eql? "user@user.com"
    expect(valid_email).to be true
end

E("que eu esteja na página inicial") do
  visit(root_path)
end

E("eu clicar no botão {string}") do |string|
  click_button(button)
end

Dado("a página de solicitação de passagens seja carregada corretamente") do
  pending
end

E("exista um botão para escolher um período para fazer uma solicitação") do
  find("#escolher_periodo")
end

Então("eu devo estar em uma página com uma tabela com os dados:") do
  pending
end 