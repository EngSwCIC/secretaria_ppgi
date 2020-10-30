Dado("Dado que eu esteja autenticado como usuario {string}") do |string|
  User.create(full_name: string, email: 'admin1@admin.unb.br', password: 'password',
  registration_number: "123456789", role: 1
  )
  visit new_user_session_path
  fill_in :user_email, with: 'admin1@admin.unb.br'
  fill_in :user_password, with: 'password'
  click_button "Log in"
end

Dado('que esteja na página de credenciamento') do |page_credenciamento|
  pending #visit path_to(page_credenciamento)
end

Quando('eu aperto o botão {string}') do |string|
  pending #click_button(string)
end

Então('eu espero ver a mensagem {string}') do |string|
  @expected_message = string
end

Quando('eu adiciono um valor {string} para {string2}') do |string, string2|
  fill_in(string2, :with => string)
end