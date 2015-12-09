require 'bbc/a11y/standards'

module BBC
  module A11y

    class Linter
      def initialize(page, standards=Standards.all)
        @page = page
        @standards = standards
      end

      def run
        errors = []
        @standards.each do |standard|
          standard.new(@page).call(errors)
        end
        LintResult.new(errors)
      end
    end

    class LintResult
      def initialize(errors)
        @errors = errors
      end

      def passed?
        @errors.empty?
      end

      def failed?
        !passed?
      end

      def to_s
        @errors.map(&:to_s).join("\n")
      end

      attr_reader :errors
    end

  end
end
