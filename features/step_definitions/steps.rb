
Dado /^que meu banco de dados está inicializado$/ do
    User.destroy_all
    User.create(full_name: "Secretário", email: "secretary@secretary.com", password: "admin123", role: "secretary", registration: "000000000")
    User.create(full_name: "Administrador", email: "admin@admin.com", password: "admin123", role: "administrator", registration: "000000000")
    User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    User.create(full_name: "Professor", email: "professor@professor.com", password: "admin123", role: "professor", registration: "000000000")
    Requirement.destroy_all
    Requirement.create(name: "Nome", description: "Nome nome nome nome")
    # Setup.destroy_all
    # Setup.create(inicio: DateTime.new(2020, 10, 16, 22, 35, 0), fim:DateTime.new(2020, 10, 25, 22, 35, 0))
    # Setup.create(inicio: DateTime.new(2020, 11, 16, 22, 35, 0), fim:DateTime.new(2020, 11, 25, 22, 35, 0))
end

Dado /^que meu banco de dados está inicializado com os prazos das solicitações$/ do
    Setup.destroy_all
    Setup.create(inicio: DateTime.new(2020, 10, 16, 22, 35, 0), fim:DateTime.new(2020, 10, 25, 22, 35, 0))
    Setup.create(inicio: DateTime.new(2020, 11, 16, 22, 35, 0), fim:DateTime.new(2020, 11, 25, 22, 35, 0))
end

Dado /^que eu estou na "([^\"]+)"$/ do |path|
    if path == "home"
        visit root_path
    elsif path == "página de login"
        visit new_user_session_path
    end
end

Dado /^que eu estou logado como "([^\"]+)"$/ do |user|
    if user == "administrador"
        email = "admin@admin.com"
        senha = "admin123"
    elsif user == "estudante"
        email = "student@student.com"
        senha = "admin123"
    elsif user == "professor"
        email = "professor@professor.com"
        senha = "admin123"
    elsif user == "secretário"
        email = "secretary@secretary.com"
        senha = "admin123"
    end
    steps %Q{
        Dado que eu estou na \"página de login\"
        Quando eu preencho o campo \"user_email\" com o valor \"#{email}\"
        Quando eu preencho o campo \"user_password\" com o valor \"#{senha}\"
        E eu aperto no botão \"Entrar\"
    }
end

Quando /^eu preencho o campo "([^\"]+)" com o valor "([^\"]+)"$/ do |campo, valor|
    fill_in(campo, :with => valor)
end

E /^eu aperto no botão "([^\"]+)"$/ do |botao|
    click_button(botao)
end

Dado /^que eu estou na "([^\"]+)" e eu estou logado como "([^\"]+)"$/ do |path, user|
    steps %Q{
        Dado que eu estou logado como \"#{user}\"
        Dado que eu estou na \"#{path}\"
    }
end

Quando /^eu clico no link "([^\"]+)"$/ do |link|
    click_link(link)
end

Então /^eu espero ver "([^\"]+)"$/ do |texto|
    expect(page).to have_content texto
end


Dado /^que eu criei um requisito com o nome "([^\"]+)" e com o valor "([^\"]+)" como administrador$/ do |nome, description|
    steps %Q{
        Dado que eu estou na \"home\" e eu estou logado como \"administrador\"
        Quando eu aperto no botão \"Requerimentos\"
        Quando eu aperto no botão \"Novo requerimento\"
        E eu preencho o campo \"requirement_name\" com o valor \"#{nome}\"
        E eu preencho o campo \"requirement_description\" com o valor \"#{description}\"
        Quando eu aperto no botão \"Criar Requerimento\"
        Então eu espero ver \"Requerimento criado com sucesso.\"
    }
end

Então /^eu não espero ver "([^\"]+)"$/ do |texto|
    expect(page).to have_no_content texto
end

Quando /^eu não preencho o campo "([^\"]+)"$/ do |texto|
    
end

Quando /^eu seleciono o valor "([^\"]+)" na lista "([^\"]+)"$/ do |value, lista|
    find(:select, lista).first(:option, value).select_option
end

E /^eu confirmo o popup$/ do
    # page.driver.browser.switch_to().alert.accept
    # page.driver.accept_js_confirms!
    # selenium.confirmation
    # page.execute_script 'window.confirm = function () { return true }'
    begin
        main, popup = page.driver.browser.window_handles
        within_window(popup) do
            click_on("Ok")
        end
        rescue
    end
end

E /^eu aperto no botão "([^\"]+)" na linha "([^\"]+)"$/ do |botao, linha|
    page.find(:xpath, "//tbody/tr[#{linha}]").click_button(botao)
end