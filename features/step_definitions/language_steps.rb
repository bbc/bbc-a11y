Then(/^the <html> element must have a `lang` attribute$/) do
  page.must_have_lang_attribute
end

Then(/^the main natural language of the page must match that attribute$/) do
  expected_language = language.detect(page)
  puts "Detected page language: #{expected_language}"
  page.must_have_lang_attribute_of(expected_language)
end

Then(/^any other tags with a lang attribute must contain text of that language$/) do
  pending # express the regexp above with the code you wish you had
end
Then(/^all elements with `lang` attribute must have content in that natural language$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^any parts expressed in a natural language different to the main language of the page must have a matching `lang` attribute$/) do
  pending # express the regexp above with the code you wish you had
end

