require 'capybara'
require 'bbc/a11y/linter'
require 'bbc/a11y/javascript'

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

Given(/^a page with the HTML:$/) do |html|
  WebServer.ensure_running_on(54321)
  WebServer.write_page "scenario.html", html
  browser.visit 'http://localhost:54321/scenario.html'
end

Given(/^a page with the body:$/) do |body_html|
  WebServer.ensure_running_on(54321)
  WebServer.write_page "scenario.html", "<html><body>#{body_html}</body></html>"
  browser.visit 'http://localhost:54321/scenario.html'
end

After do
  WebServer.delete_page "scenario.html"
end

When(/^I validate the \"([^\"]+)\" standard$/) do |standard_name|
  browser.execute_script(BBC::A11y::Javascript.bundle)
  validation = browser.evaluate_script("a11y.validate(#{standard_name.to_json})")
  if validation['results'].size != 1
    raise "#{validation['results'].size} standards match '#{pattern}'"
  end
  @result = BBC::A11y::LintResult.from_json(validation)
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
  expect(all_output).to include("\e[31m✗")
end

Then(/^I see monochrome output$/) do
  all_output = all_commands.map { |c| c.output }.join("\n")
  expect(all_output).not_to include('[0;31;49m✗')
end
