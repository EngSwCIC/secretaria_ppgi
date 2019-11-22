#Cadastro de novo topico/pergunta/resposta pelo adm
Given("Que o usuario esta logado com {string} e {string}") do |string, string2|
    visit '/users/sign_in'
    User.create(full_name: "administrador_cucumber", email: string ,password: string2, role: "administrator", registration: "000000000")
    fill_in 'user_email', with: string
    fill_in 'user_password', with: string2
    click_on 'Log in'
    page.should have_content("Signed in successfully.")
  end
  
  Given("O usuario esta na tela de exibicao do faq") do
    visit '/faqs'
    expect(page).to have_current_path('/faqs')
  end
  
  When("O usuario clica no botao {string}") do |string|
    page.click_link('Nova Entrada no FAQ')
  end
  
  Then("O usuario deve estar na tela em que insere o {string},{string},{string}") do |string, string2, string3|
    expect(page).to have_current_path('/faqs/new')
  end
  
  When("O usuario preenche o titulo,pergunta,resposa com uma {string},{string},{string}") do |string, string2, string3|
    fill_in 'faq_topico', with: string
    fill_in 'faq_pergunta', with: string2
    fill_in 'faq_resposta', with: string3
  end
  
  When("O usuario clica no botao de {string}") do |string|
    click_on 'Create Faq'
  end
  
  Then("Um novo faq e adicionado") do
    page.should have_content("Faq was successfully created.")
  end


  #Usuario que nao seja admin nao pode cadastrar novo topico/pergunta/resposta

  Given("Que o usuario nao esta logado") do
    visit '/'
    page.should have_no_content("Cargo: administrator")
  end
  
  Given("O usuario esta na tela dos faqs") do
    visit '/faqs'
    expect(page).to have_current_path('/faqs')
  end
  
  
  Then("O usuario nao pode visualizar o botao {string}") do |string|
    page.should have_no_link("Create Faq")
  end
  
  When("O usuario acessa a rota {string}") do |string|
    visit string
    expect(page).to have_current_path(string)
  end
  
  When("Clica em {string}") do |string|
    fill_in 'faq_topico', with: 'a'
    fill_in 'faq_pergunta', with: 'b'
    fill_in 'faq_resposta', with: 'c'
    click_on string
  end
  
  Then("O usuario nao pode criar um novo faq") do
    page.should have_content("Not admin")
  end
  
  
  