require 'rspec/expectations'
require 'capybara/rspec/matchers'

module BBC
  module A11y

    class Page

      include RSpec::Matchers
      include Capybara::RSpecMatchers

      def initialize(browser)
        @browser = browser
      end

      def must_have_lang_attribute
        expect(browser).to have_css('html[lang]')
      end

      def must_have_lang_attribute_of(expected_code)
        expect(browser.find('html')['lang'].split('-')[0]).to eq expected_code
      end

      def to_s
        browser.text
      end

      private

      attr_reader :browser
      private :browser
    end

  end
end
