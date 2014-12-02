When /^a user goes to the login page$/ do
	visit root_path
	visit "/session/new"
end

When /^the user goes to the broadcasts page$/ do
	visit root_path
	visit "/broadcasts"
end

Given /^a user with username "([^\"]*)" and password "([^\"]*)"$/ do |login, password|
	fill_in "login", :with => login
	fill_in "password", :with => password
end

Then /^the user enters invalid information$/ do
	fill_in "login", :with => "failUser"
	fill_in "password", :with => "FailPassword"
end

And /^presses Login$/ do
	within(".content") do
		click_button "Login"
	end
end

Then /^the user should see "(.*?)"$/ do |text|
  expect(page).to have_content "#{text}"
end

Given /^a signed in user with username "([^\"]*)" and password "([^\"]*)"$/ do |login, password|
	signIn(login, password)
end

Then /^the user presses "([^\"]*)"$/ do |button|
	click_button "#{button}"
end

Then /^the user should see links "([^\"]*)"$/ do |pages|
	pagesArr = pages.split(',')
	pagesArr.each do |pageName|
		expect(page).to have_content "#{pageName}"
	end
end
