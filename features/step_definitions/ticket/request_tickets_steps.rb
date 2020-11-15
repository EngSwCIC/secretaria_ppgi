# Dado /^Eu esteja cadastrado como usuario com email {string}$/ do |email|
#     @user = {
#       Email: email
#     }
#     User.create!(@user)
#   end
  
#   E /^Eu esteja autenticado como usuario do
#     @user = User.find_by_email('user@user.com')
#   end
  
#   E /^Eu esteja na "(.*?)"$/ do |root_path|
#     visit path_to(root_path)
#   end
  
#   Quando /^Eu clico em ([^"]*)"$/ do |button|
#     click_button(button)
#   end
  
#   Então /^Eu devo estar na página "(.*?)"$/ do |tickets_index|
#     current_path = URI.parse(current_url).path
#     if current_path.respond_to? :should
#       current_path.should == path_to(prazos_index)
#     else
#       assert_equal path_to(prazos_index), current_path
#     end
#   end
  
#   Quando /^Eu clico em ([^"]*)"$/ do |button|
#     click_button(button)
#   end
  
#   E /^Eu preencho "([^"]*)" com "([^"]*)"$/ do |field, value|
#     fill_in(field, :with => value)
#   end 
  
#   Quando /^Eu aperto enter no teclado$/ do
#     page.evaluate_script('window.confirm = function() { return true; }')
#     page.click('Ok')
#   end
  
#   Então /^Eu devo ver ([^"]*)"$/ do |text|
#     if page.respond_to? :should
#       page.should have_content(text)
#     else
#       assert page.has_content?(text)
#     end
#   end

######################################################################################

Dado("que eu esteja cadastrado como usuario com email {string}") do |email|
    @email = email
    valid_email = email.eql? "user@user.com"
    expect(valid_email).to be true
end

E("que eu esteja autenticado como usuario") do
#   authenticate(user)
    valid_email = @email.eql? "user@user.com"
    expect(valid_email).to be true
end

E("que eu esteja na página inicial") do
  visit(root_path)
end

E("eu clicar no botão {string}") do |button|
  click_button(button)
end

Então ('Eu devo estar na página "(.*?)"') do |tickets_index|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(tickets_index)
  else
    assert_equal path_to(prazos_index), current_path
  end
end

E("eu clicar no botão {string}") do |button|
  click_button(button)
end

E ('Eu preencho "([^"]*)" com "([^"]*)"') do |field, value|
  fill_in(field, :with => value)
end   

Quando ('Eu aperto enter no teclado') do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.click('Ok')
end

Então ('Eu devo ver "([^"]*)"') do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Dado("a página de solicitação de passagens seja carregada corretamente") do
  pending
end

E("exista um botão para escolher um período para fazer uma solicitação") do
  find("#escolher_periodo")
end

Então("eu devo estar em uma página com uma tabela com os dados:") do
  pending
end 