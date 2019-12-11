Given (/^I am on the sign in page$/) do
	visit 'http://localhost:3000/users/sign_in'
end

Then (/^I should be on 'new_registration_path' page$/) do
  expect(current_url).to eq "http://localhost:3000/users/sign_up"
end
