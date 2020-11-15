Dado /^Eu esteja cadastrado como usuario, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}$/ do |Name, Email, Pasword, Role, Registration|
  @user = {
    Name: 'Usuario',
    Email: 'user@user.com',
    Password: 'user123',
    Role: "user",
    Registration: "000000000"
  }
  User.create!(@user)
end

E /^Eu esteja autenticado como usuario do
  @user = User.find_by_email('user@user.com')
end

E /^Eu esteja na (.+)$/ do |root_path|
  visit path_to(root_path)
end

Quando /^Eu clico em ([^"]*)"$/ do |button|
  click_button(button)
end

Então /^Eu devo estar na página (.+)$/ do |tickets_index|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(prazos_index)
  else
    assert_equal path_to(prazos_index), current_path
  end
end

Quando /^Eu clico em ([^"]*)"$/ do |button|
  click_button(button)
end

E /^Eu preencho "([^"]*)" com "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end 

Quando /^Eu aperto enter no teclado$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.click('Ok')
end

Então /^Eu devo ver ([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
