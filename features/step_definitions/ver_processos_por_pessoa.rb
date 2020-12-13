Dado('que estou estou na página de secretário') do |page_secretario|
  visit path_to(page_secretario)
end

Dado('clico em {string}') do |string|
  click_button(string)
end

Dado('que estou na pagina de busca por nome') do |page_search_name|
  visit path_to(page_page_search_name)
end

Quando('preencher nome em {string} com {string2}') do |string, string2|
  fill_in(string, :with => string2)
end

Então("o nome deve constar no db") do |string|
expect(File.readlines(file).grep({string})
end

Então("o nome não deve constar no db") do |string|
  expect(File.readlines(file).not_to grep({string})
end

Então("os processos de {string} devem constar") do |file|
  @expected_message = @processo['files']
  end