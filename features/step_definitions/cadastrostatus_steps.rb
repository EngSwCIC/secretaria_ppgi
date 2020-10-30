Dado('que estou estou na página de secretário') do |page_secretario|
  visit path_to(page_secretario)
end

Dado('clico em {string}') do |string|
  click_button(string)
end

Dado('que estou na pagina de cadastrar um status') do |page_cadastro_status|
  visit path_to(page_cadastro_status)
end

Quando('preencher em {string} com {string2}') do |string, string2|
  fill_in(string, :with => string2)
end

Quando('seleciono {string} em {string2}') do |string, string2|
  select(string, :from => string2)
end

Quando('clicar em {string}') do |string|
  click_button(string)
end

Então('deveria estar de volta na pagina de cadastrar um status') do |page_cadastro_status|
  visit path_to(page_cadastro_status)
end

Então('deveria aparecer {string}') do |string|
  @expected_message = string
end