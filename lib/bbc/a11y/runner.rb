require 'bbc/a11y/standards'
require 'bbc/a11y/javascript'
require 'phantomjs/poltergeist'

Capybara.default_driver = :poltergeist

module BBC
  module A11y
    class Runner
      def initialize(settings, listener)
        @settings = settings
        @listener = listener
      end

      def run
        @summary = RunSummary.new
        @summary.pages = @settings.pages.size
        @settings.pages.each do |page_settings|
          lint_result = check_standards_for(page_settings)
          @summary.errors += lint_result.errors.size
          @summary.skips += lint_result.skipped.size
          @listener.page_tested(page_settings, lint_result)
        end
        @listener.all_pages_tested(@summary)
      end

      private

      def check_standards_for(page_settings)
        Linter.new.lint(page_settings)
      end

      class RunSummary
        def initialize
          @pages = 0
          @errors = 0
          @skips = 0
        end

        attr_accessor :pages
        attr_accessor :errors
        attr_accessor :skips

        def fail?
          @errors > 0
        end
      end
    end
  end
end
