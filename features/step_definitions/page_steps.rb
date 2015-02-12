When(/^I visit the page$/) do
  browser.visit settings.url
end

When(/^I view the page with JavaScript and CSS disabled$/) do
  disable_javascript_and_css
  browser.visit settings.url
end

Then(/^the document should have a title$/) do
  page.must_have_title
end

Then(/^the title should describe the primary content of the document$/) do
  begin
    page.must_have_title_that_contains_h1_text
  rescue => error
    assert_title_describes_primary_content_of_document(browser.title, browser)
  end
end

Then(/^there should be exactly one element with `role="(.*?)"`$/) do |arg1|
  page.must_have_one_main_element
end

Then(/^there must be exactly one h1 element$/) do
  page.must_have_one_h1
end

Then(/^each heading must be followed by content or a heading of one level deeper \(h2\-h6\)$/) do
  puts "Heading hierarchy:"
  puts page.heading_hierarchy.to_s
  page.must_have_correct_heading_hierarchy
end

Then(/^there must be no elements with a title attribute whose content is repeated within the element$/) do
  page.must_have_no_elements_with_title_attribute_content_repeated_within
end

Then(/^any form fields with associated labels do not have a title attribute$/) do
  page.must_have_no_form_fields_with_label_and_title
end

Then(/^there should be no elements with a tabindex attribte of 0 or greater$/) do
  page.must_not_have_any_positive_tabindex_values
end
