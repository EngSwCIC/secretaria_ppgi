#Background
Dado("que eu estou na página {string}") do |string|
    visit "localhost:3000/#{string.downcase}"
end

E("preencho o campo {string} com {string}") do |string1, string2|
	fill_in string1, with: string2
end	

E("preencho o campo {string} com {string}") do |string1, string2|
	fill_in string1, with: string2
end	

Quando("pressiono {button}") do |button|
    click_on(button)
end

Então("eu devo ser redirecionado para {string}") do |string|
    visit "localhost:3000/#{string.downcase}"
end

#Cenário
Dado("que eu estou na página {string}") do |string|
    visit "localhost:3000/#{string.downcase}"
end

Quando("pressiono {button}") do |button|
    click_on(button)
end

Então("eu devo ser redirecionado para {string}") do |string|
    visit "localhost:3000/#{string.downcase}"
end

Quando("preencho o campo {string} com {string}") do |string1, string2|
	fill_in string1, with: string2
end	

E("pressiono {button}") do |button|
    click_on(button)
end

Então("eu devo ver {string}") do |string|
    expect(page).to have_content string
end