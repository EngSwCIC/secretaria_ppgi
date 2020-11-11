Dado("que estou logado com usuário {string} e senha {string}") do |string, string2|
  visit '/'
  click_on 'Entrar'
  fill_in 'Email', with: string
  fill_in 'Password', with: string2
  click_on 'Log in'
end

Dado("que estou em {string}") do |string|
    visit "/#{string.downcase}"
end

Quando("clico em {string}") do |string|
    click_on string
end
  
Então("devo ser redirecionado para {string}") do |string|
    visit "/#{string.downcase}"
end
  
Quando("preencho {string} com o valor {string}") do |string, string2|
    fill_in string, with: string2
end

Quando("preencho {string} com a data {string}") do |string, string2|
    fill_in string, with: string2
end
  
Então("devo ver {string}") do |string|
    expect(page).to have_content string
end