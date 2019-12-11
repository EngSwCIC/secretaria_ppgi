Given (/^I am on 'new activity' page$/) do
  visit "http://localhost:3000/activities/new"
end

And (/^I fill in 'title' with '([^"]*)'$/) do |title|
  fill_in('activity[title]', :with=> title)
end

And (/^I fill in 'description' with '([^"]*)'$/) do |description|
  fill_in('activity[description]', :with=> description)
end

And (/^I fill in 'date' with '([^"]*)'$/) do |date|
  fill_in('activity[date]', :with=> date)
end