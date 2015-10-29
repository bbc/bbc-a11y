require 'bbc/a11y/standards'

module BBC
  module A11y

    class Linter
      def initialize(page)
        @page = page
      end

      def run
        errors = []
        BBC::A11y::Standards::ContentFollowsHeadings.new(@page).call(errors)
        BBC::A11y::Standards::HeadingHierarchy.new(@page).call(errors)
        BBC::A11y::Standards::ExactlyOneMainHeading.new(@page).call(errors)
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
