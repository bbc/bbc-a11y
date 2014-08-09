Then(/^the document should have a title$/) do
  page.must_have_title
end

Then(/^the title should describe the primary content of the document$/) do
  begin
    page.must_have_title_that_contains_h1_text
  rescue => error
    puts "Automatic check failed:"
    puts error
    confirm("Does the title '#{page.title}' describe the primary content of the document?")
  end
end

Then(/^there should be exactly one element with `role="(.*?)"`$/) do |arg1|
  page.must_have_one_main_element
end

Then(/^there must be exactly one h1 element$/) do
  page.must_have_one_h1
end

Then(/^each heading must be followed by content or a heading of one level deeper \(h2\-h6\)$/) do
  page.must_have_correct_heading_hierarchy
end
