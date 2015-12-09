module BBC
  module A11y
    module Standards
      class ExactlyOneMainLandmark
        def initialize(page)
          @page = page
        end

        def call(errors)
          count = @page.all('*[role=main]').size
          if count != 1
            errors << "A document must have exactly one main landmark." +
                      " Found #{count} elements with role=\"main\"."
          end
        end

      end
    end
  end
end
