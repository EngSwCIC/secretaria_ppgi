
#Cenário feliz
Dado("que eu me encontro na página {string}") do |string|
    visit "/#{string.downcase}"
end

Quando("pressiono {string}") do |string|
    click_on(string)
end

Então("eu devo estar em {string}") do |string|
    expect(page).to have_current_path(string)
end

Quando("preencho o campo {string} com os {string}") do |string1, string2|
	fill_in string1, with: string2
end	

Quando("no campo {string} eu seleciono {string}") do |string1, string2|
    select string2, :from => string1
end


Então("eu devo conseguir ver {string}") do |string|
    expect(page).to have_content string
end

#Cenário triste
Então("devo ser redirecionado para a página {string}") do |string|
	visit "/#{string.downcase}"
end