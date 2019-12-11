Then (/^I should be on 'activities' page$/) do
  expect(current_url).to eq "http://localhost:3000/activities"
end

Then (/^I should be on 'new activity' page$/) do
  expect(current_url).to eq "http://localhost:3000/activities/new"
end

Then (/^I should be on 'edit' page$/) do
  expect(current_url).to eq "http://localhost:3000/users/edit"
end
