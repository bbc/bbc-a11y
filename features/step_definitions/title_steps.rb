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
