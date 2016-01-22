module BBC
  module A11y

    class Linter
      def lint(page_settings)
        browser.visit page_settings.url
        browser.execute_script(BBC::A11y::Javascript.bundle)
        criteria = { skip: page_settings.skipped_standards }.to_json
        validation = browser.evaluate_script("a11y.validate(#{criteria})")
        LintResult.from_json(validation)
      end

      private

      def browser
        Capybara.current_session
      end
    end

    class LintResult
      def initialize(errors, skipped)
        @errors = errors
        @skipped = skipped
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

      def self.from_json(json)
        errors = json["results"].map { |standard|
          standard["errors"].map { |error| error.join " " }
        }.flatten
        LintResult.new(errors, json["skipped"])
      end

      attr_reader :errors, :skipped
    end

  end
end
