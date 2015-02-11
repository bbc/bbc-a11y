module BBC
  module A11y
    module CucumberSupport

      module LanguageDetector
        # factory for language detector, allows us to use different mechanisms (e.g. a hard-coded language passed from settings)
        def self.new
          CLDLanguageDetector.new
        end

        require 'cld'
        class CLDLanguageDetector
          InsufficientConfidence = Class.new(StandardError)

          # returns the code of the language, or raises an error if insufficient confidence
          def detect(text)
            detected_language = CLD.detect_language(text.to_s)
            raise InsufficientConfidence unless detected_language[:reliable]
            detected_language[:code]
          end
        end
      end

    end
  end
end
