require 'capybara'
require 'bbc/a11y/linter'
require 'bbc/a11y/standards'

Given(/^a website running at http:\/\/localhost:(\d+)$/) do |port|
  WebServer.ensure_running_on(port)
end

Given(/^all the tests pass$/) do
  WebServer.ensure_running_on(54321)
  step "I run `a11y http://localhost:54321/perfect.html`"
end

Given(/^one test fails$/) do
  WebServer.ensure_running_on(54321)
  step "I run `a11y http://localhost:54321/missing_header.html`"
end

Given(/^a page with the HTML:$/) do |string|
  @page = Capybara.string(string.to_s)
end

When(/^I validate the (.+) standards$/) do |pattern|
  regexp = Regexp.new(pattern.gsub(' ', ''), Regexp::IGNORECASE)
  standards = BBC::A11y::Standards.matching regexp
  raise "No standards match '#{pattern}'" unless standards.any?
  @result = BBC::A11y::Linter.new(@page, standards).run
end

Then(/^it passes$/) do
  expect(@result).to be_passed
end

Then(/^it fails with the message:$/) do |message|
  expect(@result).to be_failed
  expect(@result.to_s).to eq message.to_s
end

Given(/^I am using a TTY terminal$/) do
  set_environment_variable('TTY', 'true')
end

Given(/^I am using a Non\-TTY terminal$/) do
  set_environment_variable('TTY', 'false')
end

When(/^I run a11y against a failing page$/) do
  step 'a website running at http://localhost:54321'
  step 'I run `a11y http://localhost:54321/missing_header.html`'
end

Then(/^I see red in the output$/) do
  all_output = all_commands.map { |c| c.output }.join("\n")
  expect(all_output).to include('[0;31;49m✗')
end

Then(/^I see monochrome output$/) do
  all_output = all_commands.map { |c| c.output }.join("\n")
  expect(all_output).not_to include('[0;31;49m✗')
end
