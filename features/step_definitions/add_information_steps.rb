Given("I am logged as a(n) {string} on Secretaria_Ppgi") do |string|
	puts string
	
end

When("I click {string}") do |string|
	puts string
	
end

Then("I should go to the {string}") do |string|
	puts string
	
end

And("I click {string}") do |string|
    puts string
end

And("I should see an error message: {string}") do |string|
    puts string
end
