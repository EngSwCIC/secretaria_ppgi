Given("I'm an administrator") do
    visit '/users/sign_in'
    User.create(full_name: "Administrador", email: "fake@admin.com", password: "admin123", role: "administrator", registration: "000000000")
    fill_in 'user_email', with: 'fake@admin.com'
    fill_in 'user_password', with: 'admin123'
    click_on 'Log in'
    page.should have_content("Signed in successfully.")
end

Given("I'm an student") do
    visit '/users/sign_in'
    User.create(full_name: "Student", email: "fake@student.com", password: "student123", role: "student", registration: "000000000")
    fill_in 'user_email', with: 'fake@student.com'
    fill_in 'user_password', with: 'student123'
    click_on 'Log in'
    page.should have_content("Signed in successfully.")
end

Given("I'm an professor") do
    visit '/users/sign_in'
    User.create(full_name: "Professor", email: "fake@professor.com", password: "professor123", role: "professor", registration: "000000000")
    fill_in 'user_email', with: 'fake@professor.com'
    fill_in 'user_password', with: 'professor123'
    click_on 'Log in'
    page.should have_content("Signed in successfully.")
end

Given("I'm an secretary") do
    visit '/users/sign_in'
    User.create(full_name: "secretary", email: "fake@secretary.com", password: "secretary123", role: "secretary", registration: "000000000")
    fill_in 'user_email', with: 'fake@secretary.com'
    fill_in 'user_password', with: 'secretary123'
    click_on 'Log in'
    page.should have_content("Signed in successfully.")
end
  
Given("I'm on the {string} page") do |string|
    visit '/' + string
    expect(page).to have_current_path('/' + string)
end
  
When("I click on the {string} button") do |string|
    click_button(string)
end
  
Then("I should see {string}") do |string|
    page.should have_content(string)
end
  
When("I fill the form with:") do |table|
    table.rows_hash.each {|field, value| fill_in field, :with => value}
end
    
Given("exists a source on the database") do
    Source.create(title: "TestSource")
end
  
Then("I should not see {string}") do |string|
    page.should have_no_content(string)
end
    
When("I click in the {string} button") do |string|
    click_button(string)
end

When("I click on the {string} link") do |string|
    page.click_link(string)
end

Given("exists an information in the database") do
    Information.create(title: "test_title", info: "test_info")
end
  