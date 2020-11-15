Quando(/(?:clico|clicar) no botão "([^"]*)"/) do |botao|
    click_on botao
end

Então(/recebo uma mensagem de (sucesso|erro)/) do |status|
    if(status == "sucesso") 
        find(".notice", text:"Página foi criada com sucesso!")

    elsif(status == "erro")
        find("#error_explanation")
    else
        raise StandardError.new("Mensagem não encontrada")
    end
end

Quando(/preencho o campo "([^"]*)" com "([^"]*)"/) do |campo, valor|
    fill_in campo, with: valor
end

Quando(/não preencho o campo "([^"]*)"/) do |campo|
    fill_in campo, with: ""
end

Dado(/redirecionado para a página "([^"]*)"/) do |pagina|
    case(pagina)
    when "Wiki de Atendimento"
        page.current_path == wiki_entries_path
    when "Processo"
        page.current_path == wiki_entry_path(id: WikiEntry.last.id)
    end
end

Dado(/esteja na página "([^"]*)"/) do |pagina|
    case(pagina)
    when "Wiki de Atendimento"
        visit wiki_entries_path
    when "Processo"
        visit wiki_entry_path(id: WikiEntry.last.id)
    end
end

Dado(/esteja conectado como usuario "([^"]*)", "([^"]*)", "([^"]*)"/) do |usuario, senha, funcao|
    #faz login
 
    User.create(full_name: "Secretário", email: "secretary@secretary.com", password: "admin123", role: "secretary", registration: "000000000")
    visit new_user_session_path
    fill_in :user_email, with: usuario
    fill_in :user_password, with: senha
    click_button "Log in"

end 

Quando(/visualizar (?:o|a|os|as) "([^"]*)"/) do |elemento|
    find(".attribute:has(strong)", text: elemento).find(".value").text != ""
end

Quando(/seleciono (?:o|a|os|as) "([^"]*)" "([^"]*)"/) do |campo, valor|
    pending
end

Quando(/envio o arquivo "([^"]*)"/) do |arquivo|
    pending # Write code here that turns the phrase above into concrete actions
end
  