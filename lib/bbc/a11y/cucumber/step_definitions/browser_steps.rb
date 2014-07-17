require 'capybara/cucumber'
Capybara.default_driver = :selenium

When(/^I visit the page$/) do
  visit(ENV['URL'])
end

Then(/^the <html> element must have a `lang` attribute$/) do
  expect(page.find('html')['lang']).to_not be_nil
end

Then(/^the main natural language of the page must match that attribute$/) do
  require 'cld'
  detected_language = CLD.detect_language(page.find('html').text)
  p detected_language
  natural_language_code = detected_language[:code]
  expect(page.find('html')['lang'].split('-')[0]).to eq natural_language_code
end

Then(/^any other tags with a lang attribute must contain text of that language$/) do
  pending # express the regexp above with the code you wish you had
end
