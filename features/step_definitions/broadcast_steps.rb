require 'rubygems'
require 'json'

Then /^the user should see list of broadcasts$/ do
  expect(page).to have_css(".sortable")
end

And /^clicks first "([^\"]*)" broadcast link$/ do |img_alt|
    first(:xpath, "//img[@alt = '#{img_alt}']/parent::a").click()
end

Then /^the user visits broadcast id "([^\"]*)" page$/ do |id|
  visit "/broadcasts/#{id}"
end

And /^the twitter feed should have the tweet "([^\"]*)"$/ do |tweet|
  response = TWITTER_ACCESS_TOKEN.get('/statuses/user_timeline.json?screen_name=chris_loftus_te&count=1')
  hash = JSON.parse(response.body)
  text = hash[0]['text']
  expect(text).to start_with (tweet)
end

And /^replaces broadcast content with "([^\"]*)"$/ do |content|
  t = Time.now
  str_time = t.strftime('%H:%M:%S')
  fill_in "broadcast_content", :with => content + " " + str_time
end

And /^replaces broadcast content with long string$/ do
  str = "abc" * 50
  fill_in "broadcast_content", :with => str
end

Then /^twitter character count left should be "(.*?)"$/ do |content|
  count = page.evaluate_script("document.getElementById('twitter-char-count').innerHTML")
  #count = find(:xpath, "//*[@id='twitter-char-count']")
  expect(count).to eq(content)
end

And /^replaces URL box with "([^\"]*)"$/ do |content|
  fill_in "shorten_url", :with => content
end

And /^URL box should not be empty$/ do
  expect(find_field('shorten_url').value).not_to eq('')
end

And /^URL box contents length should be shorter than "([^\"]*)"$/ do |length|
  expect(find_field('shorten_url').value.length).to be < length.to_i
end

Then /^an email should be received$/ do
  email = ActionMailer::Base.deliveries.first
  expect(email.from.first).to eq("crh13@aber.ac.uk")
  expect(email.to.first).to eq("crh13@aber.ac.uk")
  expect(email.body).to include("idUnique ab12 #CraigBakes email cucumbers")
end
