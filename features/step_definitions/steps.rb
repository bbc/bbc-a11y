Given(/^a standards-compliant website running at http:\/\/localhost:(\d+)$/) do |port|
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

require 'bbc/a11y/cucumber_support/heading_hierarchy'
require 'capybara'

class Errors < Array
end

class Linter
  def initialize(page)
    @page = page
  end

  def run
    errors = Errors.new
    BBC::A11y::CucumberSupport::HeadingHierarchy.new(@page).call(errors)
    LintResult.new(errors)
  end
end

class LintResult
  def initialize(errors)
    @errors = errors
  end

  def passed?
    @errors.empty?
  end

  def failed?
    !passed?
  end

  def to_s
    @errors.map(&:to_s).join("\n")
  end
end

Given(/^a page with the HTML:$/) do |string|
  @page = Capybara.string(string.to_s)
end

When(/^I run the tool$/) do
  @result = Linter.new(@page).run
end

Then(/^it passes$/) do
  expect(@result).to be_passed
end

Then(/^it fails with the message:$/) do |message|
  expect(@result).to be_failed
  expect(@result.to_s).to include message.to_s
end
