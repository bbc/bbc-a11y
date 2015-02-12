require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'


Capybara.default_driver = :poltergeist

Before do
  Capybara.use_default_driver
end

After do
  Capybara.reset_sessions!
end

module BBC
  module A11y

    module Browser
      def browser
        Capybara.current_session
      end

      def disable_javascript_and_css
        Capybara.current_driver = :without_javascript_or_css
      end
    end

  end
end

World(BBC::A11y::Browser)
