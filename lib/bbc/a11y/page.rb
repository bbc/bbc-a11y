require 'rspec/expectations'
require 'capybara/rspec/matchers'
require 'bbc/a11y/heading_hierarchy'

module BBC
  module A11y

    class Page

      include RSpec::Matchers
      include Capybara::RSpecMatchers

      def initialize(browser)
        @browser = browser
      end

      def title
        browser.title
      end

      def must_have_lang_attribute
        expect(browser).to have_css('html[lang]')
      end

      def must_have_lang_attribute_of(expected_code)
        expect(browser.find('html')['lang'].split('-')[0]).to eq expected_code
      end

      def must_have_title
        expect(browser.title).not_to be_empty
      end

      def must_have_title_that_contains_h1_text
        expect(browser.title).to include(browser.find('h1').text)
      end

      def must_have_one_main_element
        expect(browser.all('[role="main"]').length).to eq 1
      end

      def must_have_one_h1
        expect(browser.all('h1', visible: false).length).to eq 1
      end

      def must_have_correct_heading_hierarchy
        HeadingHierarchy.new(browser).validate
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
