Dado("que eu esteja logado como professor com o email {string} e a senha {string}") do |string, string2|
  User.create(username: 'professor123', email: string, password: string2, course: "CIC", is_admin: false)
  visit new_user_session_path
  click_button "Entrar"
  fill_in :user_email, with: string
  fill_in :user_password, with: string2
  click_button "Log in"
end

Dado("que eu esteja na pagina {string}") do |string|
  pending #expect(current_path).to eq("/#{string}")
end

Dado("que exista a pendencia de credenciamento no sistema com o botao {string)") do |button|
  pending #page.should have_button("Solicitar credenciamento")
end

Entao("preencho o campo de processo SEI {string}") do |string|
  pending #fill_in :processo_sei, with: string

E("clico no botao {string}") do |button|
  pending #click_button "Solicitar credenciamento"
end

E("espero ver a mensagem de confirmacao {string}") do |string|
  pending #@expected_message = string
end
 
