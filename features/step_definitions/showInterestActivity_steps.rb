Given("I am on the {string} page") do |string|
    visit "localhost:3000/#{string.downcase}"
  end
  
  And("I fill in 'email' with {string}") do |string|
    fill_in string
  end
  
  And("I fill in 'password' with {string}") do |string|
    fill_in string
  end
  
  When("I press {string}") do |string|
    click_on(string)
  end
    
  Then("I should be on {string}") do |string|
    visit "localhost:3000"
  end
  
  
  When("I press {string}") do |string|
     click_on(string)
   end
   
  Then("I should be on {string}") do |string|
    visit "localhost:3000/#{string.downcase}"
  end
  
  When("I check {string}") do |string|
     check(string)
   end
   
  Then("I should see on 'calendar' page only {string}") do |string|
    visit "localhost:3000/calendar//#{string.downcase}"
  end
  
  When("I press {string}") do |string|
     click_on(string)
   end
   
  Then("I should be on {string}") do |string|
    visit "localhost:3000/#{string.downcase}"
  end
  
  When("I press {string}") do |string|
     click_on(string)
   end
   
  Then("I should be on {string}") do |string|
    visit "localhost:3000/activities"
  end
