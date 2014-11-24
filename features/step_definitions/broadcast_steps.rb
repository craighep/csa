Then /^the user should see list of broadcasts$/ do
  expect(page).to have_css(".list-line-odd")
end

And /^clicks first "([^\"]*)" broadcast link$/ do |img_alt|
    first(:xpath, "//img[@alt = '#{img_alt}']/parent::a").click()
end

Then /^the user visits broadcast id "([^\"]*)" page$/ do |id|
  visit "/broadcasts/#{id}"
end

And /^the twitter feed should have the tweet$/ do
  response = TWITTER_ACCESS_TOKEN.get('/statuses/chris_loftus_te.json.json?count=1&include_rts=1&callback=?')
  puts(response.body)
end

And /^replaces broadcast content with "([^\"]*)"$/ do |content|
  t = Time.now
  str_time = t.strftime('%H:%M')
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
  expect(find_field('shorten_url').value.length).to be < length
end
