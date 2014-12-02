# Step file created for testing

Given /^a signed in user as admin$/ do
	signIn("admin", "taliesin")
end

Then /^presses "([^\"]*)"$/ do |button|
	click_button(button)
end

Then /^the user should see list of users$/ do
	expect(page).to have_css(".list-line-odd")
end

Then /^the user clicks link "([^\"]*)"$/ do |link|
	click_link "#{link}"
end

And /^clicks first "([^\"]*)" user link$/ do |img_alt|
    first(:xpath, "//img[@alt = '#{img_alt}']/parent::a").click()
end

And /^replaces surname with "([^\"]*)"$/ do |surname|
	fill_in "user_surname", :with => surname
end

And /^replaces forename with "([^\"]*)"$/ do |forename|
  fill_in "user_firstname", :with => forename
end

And /^replaces email with "([^\"]*)"$/ do |email|
  fill_in "user_email", :with => email
end

And /^replaces phone with "([^\"]*)"$/ do |phone|
  fill_in "user_phone", :with => phone
end

And /^replaces grad year with "([^\"]*)"$/ do |year|
  fill_in "user_grad_year", :with => year
end

And /^replaces user search box with "([^\"]*)"$/ do |search|
	fill_in "q", :with => search
	puts(find(:xpath, "//*[@id='q']").value)
end

Then /^the user visits user id "([^\"]*)" page$/ do |id|
	visit "/users/#{id}"
end

And /^the user checks all the search checkboxes$/ do
	check_Checkbox("grad_year", true)
	check_Checkbox("firstname", true)
	check_Checkbox("surname", true)
	check_Checkbox("email", true)
	check_Checkbox("phone", true)
end

Then /^the user checks the "([^\"]*)" checkbox$/ do |checkbox|
  id = ""
  case checkbox
    when "jobs"
      id = "user_jobs"
    when "firstname"
      id = "firstname"
    when "surname"
      id = "surname"
    when "email"
      id = "email"
    when "phone"
      id = "phone"
    when "grad year"
      id = "grad_year"
		when "mail"
			id = "grad_year"
		when "twitter"
			id = "feeds_twitter"
  end
  check_Checkbox(id, true)
end

Then /^the user unchecks the "([^\"]*)" checkbox$/ do |checkbox|
	id = ""
	case checkbox
		when "jobs"
			id = "user_jobs"
		when "firstname"
			id = "firstname"
		when "surname"
			id = "surname"
		when "email"
			id = "email"
		when "phone"
			id = "phone"
		when "grad year"
			id = "grad_year"
		when "mail"
			id = "feeds_email"
		when "twitter"
			id = "feeds_twitter"
	end
	check_Checkbox(id, false)
end

Then /^the user clicks ok on confirmation dialog$/ do
  page.evaluate_script("window.confirm = function (msg) {
    $.cookie('confirm_message', msg)
    return true
  }")
end

Then /^the user presses cancel on confirmation dialog$/ do
	page.driver.browser.accept_js_confirms
end

And /^replaces username with "([^\"]*)"$/ do |login|
  fill_in "user_user_detail_attributes_login", :with => login
end

And /^replaces password with "([^\"]*)"$/ do |password|
  fill_in "user_user_detail_attributes_password", :with => password
end

And /^replaces password confirmation with "([^\"]*)"$/ do |passwordConf|
  fill_in "user_user_detail_attributes_password_confirmation", :with => passwordConf
end

When /^the user goes to the users page$/ do
	visit root_path
	visit "/users"
end

When /^the user goes to the user page "([^\"]*)" through address bar$/ do |page|
	visit root_path
  visit "/users?page=#{page}"
end

Then /^the user fills in all valid details$/ do
	fill_in "user_surname", :with => "AnotherTest"
	fill_in "user_firstname", :with => "User"
	fill_in "user_email", :with => "crh13333@aber.ac.uk"
	fill_in "user_phone", :with => "12345678910"
	fill_in "user_grad_year", :with => "2014"
	fill_in "user_user_detail_attributes_login", :with => "AnotherUser"
	fill_in "user_user_detail_attributes_password", :with => "test"
	fill_in "user_user_detail_attributes_password_confirmation", :with => "test"
end

Then /^the user fills in all details matching another user$/ do
	fill_in "user_surname", :with => "Chris"
	fill_in "user_firstname", :with => "Loftus"
	fill_in "user_email", :with => "cwl11@aber.ac.uk"
	fill_in "user_phone", :with => "12345678910"
	fill_in "user_grad_year", :with => "1985"
	fill_in "user_user_detail_attributes_login", :with => "admin"
	fill_in "user_user_detail_attributes_password", :with => "taliesen"
	fill_in "user_user_detail_attributes_password_confirmation", :with => "test"
end
