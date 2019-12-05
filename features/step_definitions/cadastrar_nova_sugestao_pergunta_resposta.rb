Given("Usuario logado {string} e {string}") do |string, string2|
  visit '/users/sign_in'
  User.create(full_name: "student_cucumber2", email: string ,password: string2, role: "student", registration: "000000000")
  fill_in 'user_email', with: string
  fill_in 'user_password', with: string2
  click_on 'Log in'
  page.should have_content("Signed in successfully.")
end

Given("Administrador logado {string} e {string}") do |string, string2|
  visit '/users/sign_in'
  User.create(full_name: "admin_cucumber2", email: string ,password: string2, role: "administrator", registration: "000000000")
  fill_in 'user_email', with: string
  fill_in 'user_password', with: string2
  click_on 'Log in'
  page.should have_content("Signed in successfully.")
end

Given("Esta em faqs") do
  visit '/faqs'
  expect(page).to have_current_path('/faqs')
end

When("O usuario clica {string}") do |string|
  find("a", :text => string).click
end

Then("Esta na tela que possui os campos {string},{string},{string}") do |string, string2, string3|
  expect(page).to have_current_path('/faq_sugestions/new')
end

When("O usuario preenche com {string},{string},{string}") do |string, string2, string3|
  fill_in 'faq_sugestion_topico', with: string
  fill_in 'faq_sugestion_pergunta', with: string2
  fill_in 'faq_sugestion_resposta', with: string3
end

When("Adiciona clicando em {string}") do |string|
  click_on string
end

Then("Nova sugestao para pergunta e resposta  foi adicionada") do
  page.should have_content("Faq sugestion was successfully created.")
end

Then("O usuario nao consegue visualizar o botao {string}") do |string|
  page.should have_no_link("Create Faq")
end

When("O usuario acessa o caminho {string}") do |string|
  visit string
  expect(page).to have_current_path(string)
end

Then("O usuario nao pode criar uma nova sugestao") do
  page.should have_content("Essa função é restrita a usuários cadastrados e logged-in não administradores")
end

Then("O usuario deve ver o topico como {string}, pergunta como {string} e resposta como {string}") do |string1, string2, string3|
  page.should have_content("Tópico: " + string1)
  page.should have_content("Pergunta: " + string2)
  page.should have_content("Resposta: " + string3)
end

Then("Deve aparecer um erro na tela indicando que não foi possivel salvar") do
  page.should have_content("Topico can't be blank")
  page.should have_content("Pergunta can't be blank")
  page.should have_content("Resposta can't be blank")
end
