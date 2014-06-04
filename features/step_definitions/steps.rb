When(/^I submit the page to the W3C Markup Validation Service$/) do
  w3c.validate(url)
end

Then(/^there should be no errors$/) do
  expect( w3c.errors ).to be_empty
end
