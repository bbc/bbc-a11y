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
        unless Capybara.drivers.keys.include?(:without_js)
          skip_this_scenario <<-ERROR
You need to define a non-javascript driver for Capybara in order to run this scenario. Here's an example you could use:

    require 'capybara/selenium'
    Capybara.register_driver(:without_javascript_or_css) do |app|
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile['permissions.default.stylesheet'] = 2
      profile['javascript.enabled'] = false
      Capybara::Selenium::Driver.new(app, profile: profile)
    end

You can put this code into your a11y.rb file

You'll also need to add the `selenium-webdriver` gem to your Gemfile.
          ERROR
        else
          Capybara.current_driver = :without_js
        end
      end
    end

  end
end

World(BBC::A11y::Browser)
