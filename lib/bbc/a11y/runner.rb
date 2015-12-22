require 'bbc/a11y/standards'

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
          errors = check_standards_for(page_settings)
          @summary.errors += errors.size
          @listener.page_tested(page_settings, errors)
        end
        @listener.all_pages_tested(@summary)
      end

      private

      def check_standards_for(page_settings)
        standards = Standards.for(page_settings)
        @summary.skips += Standards.all.size - standards.size
        html = open(page_settings.url).read
        Linter.new(Capybara.string(html), standards).run.errors.to_a
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
