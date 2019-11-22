Given("Que o usuario esta logado utilizando {string} e {string}") do |string, string2|
    visit '/users/sign_in'
    User.create(full_name: "administrador_cucumber", email: string ,password: string2, role: "administrator", registration: "000000000")
    fill_in 'user_email', with: string
    fill_in 'user_password', with: string2
    click_on 'Log in'
    page.should have_content("Signed in successfully.")
end

Given("O usuario esta na tela de exibicao dos faqs") do
    visit '/faqs'
    expect(page).to have_current_path('/faqs')
end

Given("O topico {string},a pergunta {string} e a resposta {string} existem") do |string, string2, string3|
    Faq.create(topico: string, pergunta: string2, resposta: string3)
end

When("Clica no botao editar para editar o topico {string},a pergunta {string} e a resposta {string}") do |string, string2, string3|
    visit '/faqs'
    pergunta = Faq.find_by pergunta: string2
    Capybara.ignore_hidden_elements = true
    find("a[href='#{"/faqs/"+pergunta.id.to_s+"/edit"}']").click
    Capybara.ignore_hidden_elements = false
end

  
Then("Deve estar na tela em que edita o topico {string},a pergunta {string} e a resposta {string}") do |string, string2, string3|
    pergunta = Faq.find_by pergunta: string2
    expect(page).to have_current_path("/faqs/"+pergunta.id.to_s+"/edit")
    
end
  

When("Preenche o titulo,pergunta,resposa com uma {string},{string},{string}") do |string, string2, string3|
    fill_in 'faq_topico', with: string
    fill_in 'faq_pergunta', with: string2
    fill_in 'faq_resposta', with: string3
end

When("Clica no botao de {string}") do |string|
    click_on 'Update Faq'
end

Then("O topico,a pergunta e a resposta sao atualizados") do
    page.should have_content("Faq was successfully updated.")
end
