Given("Que o usuario esta logado com as credenciais {string} e {string}") do |string, string2|
    visit '/users/sign_in'
    User.create(full_name: "student_cucumber", email: string ,password: string2, role: "student", registration: "000000000")
    fill_in 'user_email', with: string
    fill_in 'user_password', with: string2
    click_on 'Log in'
    page.should have_content("Signed in successfully.")
  end
  
  Given("O usuario esta na tela de faqs") do
    visit '/faqs'
    expect(page).to have_current_path('/faqs')
  end
  
  Given("Existe pelo menos um topico cadastrado") do
    Faq.create(topico: "Topico", pergunta: "Pergunta", resposta: "Resposta")
  end
  
  When("O usuario clica no botao com nome {string}") do |string|
    visit '/faqs'
    pergunta = Faq.find_by pergunta: string
    Capybara.ignore_hidden_elements = true
    
    find("a", :text => string).click
    Capybara.ignore_hidden_elements = false
  end
  
  Then("O usuario deve estar na tela em que existe o campo,{string}") do |string|
    page.should have_content("Nova Sugestão de FAQ")
  end
  
  When("O usuario preenche o campo respostaa com uma {string}") do |string|
    fill_in 'faq_sugestion_resposta', with: string

  end
  
  When("O usuario clica em {string}") do |string|
    click_on string
  end
  
  Then("Um nova sugestao foi adicionada") do
    page.should have_content("Faq sugestion was successfully created.")
  end
