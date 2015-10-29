module BBC
  module A11y
    module Standards
      class ExactlyOneMainHeading
        def initialize(page)
          @page = page
        end

        def call(errors)
          count = @page.all('h1').size
          if count != 1
            errors << "A document must have exactly one heading." +
                      " Found #{count} h1 elements."
          end
        end

      end
    end
  end
end
