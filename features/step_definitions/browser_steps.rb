When(/^I visit the page$/) do
  browser.visit settings.url
end

When(/^I view the page with JavaScript and CSS disabled$/) do
  disable_javascript_and_css
  browser.visit settings.url
end

Then(/^there should be exactly one element with `role="(.*?)"`$/) do |arg1|
  page.must_have_one_main_element
end
