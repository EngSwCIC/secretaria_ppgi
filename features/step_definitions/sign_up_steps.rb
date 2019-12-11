Given (/^I am on the sign up page$/) do
	visit 'http://localhost:3000/users/sign_up'
end

And(/^I fill in 'email' with '([^"]*)'$/) do |email|
	fill_in('user[email]', :with=> email)
end

And (/^I fill in 'full_name' with '([^"]*)'$/) do |full_name|
	fill_in('user[full_name]', :with=> full_name)
end

Then (/^'administrator' should be an option for 'role'$/) do
	select('administrator', from: 'user[role]')
end

And (/^'student' should be an option for 'role'$/) do
	select('student', from: 'user[role]')
end

And (/^'secretary' should be an option for 'role'$/) do
	select('secretary', from: 'user[role]')
end

And (/^'professor' should be an option for 'role'$/) do
	select('professor', from: 'user[role]')
end

And (/^I fill in 'password' with '([^"]*)'$/) do |password|
	fill_in('user[password]', :with=> password)
end

And (/^I fill in 'password_confirmation' with '([^"]*)'$/) do |password_confirmation|
	fill_in('user[password_confirmation]', :with=> password_confirmation)
end

When (/^I press '([^"]*)'$/) do |button|
	click_on(button)
end

Then (/^I should be on 'root_path' page$/) do
  expect(current_url).to eq "http://localhost:3000/"
end

Then (/^I should be on 'new_session_path' page$/) do
  expect(current_url).to eq "http://localhost:3000/users/sign_in"
end