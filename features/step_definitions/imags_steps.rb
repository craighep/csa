When /^the user uploads an image another user has$/ do
  attach_file('image_file', File.expand_path('features/support/mouse.jpg'))
end

Then /^the user should see their image$/ do
  variable=find(:xpath, "//img[@alt='Image of Chris Loftus']")
  expect(variable['src']).to include("mouse.jpg")
end

When /^the user uploads an image$/ do
  attach_file('image_file', File.expand_path('features/support/mouse.jpg'))
end

When /^the user uploads a none-image$/ do
  attach_file('image_file', File.expand_path('features/support/lolprice.mp3'))
end

Then /^the user should still see a blank picture$/ do
  variable=find(:xpath, "//img")
  expect(variable['src']).to include("blank-cover_large.png")
end
