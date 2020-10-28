Dado("que estou na página {string}") do |string|
	visit "localhost:3000/#{string.downcase}" 
end

Quando("eu clico em {string}") do |string|
	click_on string
end

Então("eu devo ser redirecionado para {string}") do |string|
	visit "localhost:3000/#{string.downcase}"
end

E("eu devo ver {string}") do |string|
	expect(page).to have_content string
end