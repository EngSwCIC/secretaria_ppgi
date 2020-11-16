Given("I'm an administrator") do
    
end

When("I press {string}") do |button|
    puts button
end

Then ("I should see {string}") do |string|
    puts string
end

When("I click on the {string} link") do |string|
  puts string
end

When("I click in the {string} button") do |string|
  puts string
end

When("I click on the {string} link on the {string}") do |string, string2|
  puts string
end

When("I fill the form with:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  data = table.raw
end


