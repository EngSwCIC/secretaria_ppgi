Then("O usuario nao consegue visualizar as sugestoes") do
    page.should have_content("Essa função é restrita a administradores")
    expect(page).to have_current_path("/faqs")
end

When("O usuario tenta acessar o caminho {string}") do |string|
    visit string
end

Then("Ele está na página com as sugestoes de FAQ") do
    expect(page).to have_current_path("/faq_sugestions")
end

Given("Existe pelo menos um sugestao cadastrada") do
    FaqSugestion.create(topico: "Topico", pergunta: "Pergunta", resposta: "Resposta", faq_id: nil)
end

Then("A sugestao deve ter sido excluida") do
    page.should have_content("Faq sugestion was successfully destroyed.")
end