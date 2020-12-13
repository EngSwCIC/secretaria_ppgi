Given("Que Usuario esteja logado como email {string} e  {string}")_ do |string, string2|
  visit '/users/sign_in'
  User.create(full_name: "usuario_teste", email: string, password: string2, role:"estudante", resgistration:"00000000001")
  fill_in 'user_email', with: string
  fill_in 'user_password', with: string2
  click_on 'Log in'
  page.should have_content("Welcome! You have signed up successfully.")
  end 

  And("Esteja página inicial e logado") do
    pending
  end

  And("Clicar no link {link_faq}") do
    pending
  end

  When("O Clicar no botão {button_name}") do |button_name|
    pending
  end

  Then("O usuário preenche os campos de texto {field1} e {field2} com uma {value1} e {value2}") do |field1, field2, value1,value1|
    pending
  end

  Then("O usuário clica {button_name}") do |button_name|
    pending
  end

  Then("será cadastrado uma nova sugestão de pergunta e resposta") do
    pending
  end







