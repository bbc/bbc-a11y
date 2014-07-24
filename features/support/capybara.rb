require 'capybara'

After do
  browser.reset!
end

module HasBrowser
  def browser
    @@browser ||= Capybara::Session.new(:selenium)
  end
end

World(HasBrowser)
