require 'bbc/a11y/cucumber_support/language_detector'
require 'bbc/a11y/cucumber_support/page'
require 'bbc/a11y/cucumber_support/w3c'

module BBC
  module A11y

    # These are the methods available to step definitions 
    # that test the specifications.
    module CucumberSupport

      class << self
        attr_accessor :current_page_settings
      end

      # Returns an object that can validate URLs
      def w3c
        @w3c ||= W3C.new
      end

      # An object that represents the current page being viewed in the browser
      def page
        @page ||= Page.new(browser)
      end

      # An object to detect the natural lanugage of the page
      def language
        @language ||= LanguageDetector.new
      end

      # Settings specified for this test run
      def settings
        CucumberSupport.current_page_settings
      end

      # Ask for a manual check
      def confirm(question)
        formatted_question = "\n  #{question} [Y/n]"
        answer = ask(formatted_question).strip
        fail unless ["Y", "y", ""].include?(answer)
      end

    end
  end

end

