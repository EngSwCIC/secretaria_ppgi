Given("I am on the {string} page and click on {string}") do |string1, string2|
    visit string1
    click_on string2
  end
  
And("I fill in 'email' with {string}") do |string|
    fill_in 'Email', with: string
end
  
And("I fill in 'password' with {string}") do |string|
    fill_in 'Password', with: string
end

And("I click on {string}") do |string|
    click_on string
end
    
Then("I should be on {string}") do |string|
    visit "/"
end

Given("I am on the {string} page") do |string|
    visit string
end

Then("I should be on {string} page") do |string|
    visit string.downcase
end
  
When("I check {string}") do |string|
     check string
end
   
Then("I should see on 'calendar' page only {string}") do |string|
    visit "localhost:3000/#{string.downcase}"
end
