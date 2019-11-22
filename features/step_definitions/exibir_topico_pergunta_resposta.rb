Given("Que o usuario esta em {string}") do |string|
    visit string
    expect(page).to have_current_path(string)
end

Given("Existe o topico {string},a pergunta {string} e a resposta {string}") do |string, string2, string3|
    Faq.create(topico: string, pergunta: string2, resposta: string3)
end

Then("E possivel visualizar o topico {string},a pergunta {string} e a resposta {string}") do |string, string2, string3|
    visit '/faqs' 
    page.should have_field(string)
    page.should have_content(string2)
    page.should have_content(string3)
  end
  
