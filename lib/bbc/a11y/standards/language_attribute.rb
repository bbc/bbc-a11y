module BBC
  module A11y
    module Standards
      class LanguageAttribute
        def initialize(page)
          @page = page
        end

        def call(errors)
          @page.all("html:not([lang])").each do |html|
            errors << "The main language must be specified. " +
                      "<html> tag has no lang attribute."
          end
        end

      end
    end
  end
end
