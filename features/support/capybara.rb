require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

#Capybara.register_driver(:without_javascript_or_css) do |app|
#  profile = Selenium::WebDriver::Firefox::Profile.new
#  profile['permissions.default.stylesheet'] = 2
#  profile['javascript.enabled'] = false
#  Capybara::Selenium::Driver.new(app, profile: profile)
#end

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
        skip_this_scenario
      end
    end

  end
end

World(BBC::A11y::Browser)
