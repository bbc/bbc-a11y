require 'bbc/a11y/w3c'
require 'bbc/a11y/page'
require 'bbc/a11y/language_detector'
require 'bbc/a11y/settings'

module BBC
  module A11y
    module CucumberWorld
      def w3c
        @w3c ||= W3C.new
      end

      def page
        @page ||= Page.new(browser)
      end

      def language
        @language ||= LanguageDetector.new
      end

      def settings
        @settings ||= Settings.new
      end

    end
  end

end

World(BBC::A11y::CucumberWorld)
