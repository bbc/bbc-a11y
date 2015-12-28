module BBC
  module A11y
    module Standards
      class ExactlyOneMainHeading
        def initialize(page)
          @page = page
        end

        def call(errors)
          main_headings = @page.all('h1')
          count = main_headings.size
          if count == 0
            errors << "A document must have exactly one main heading." +
                      " Found 0 h1 elements."
          elsif count != 1
            errors << "A document must have exactly one main heading." +
                      " Found #{count} h1 elements:\n" +
                      main_headings.map { |h1| "* #{h1.path}" }.join("\n")
          end
        end

      end
    end
  end
end
