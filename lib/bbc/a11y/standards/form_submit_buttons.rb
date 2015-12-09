module BBC
  module A11y
    module Standards
      class FormSubmitButtons
        def initialize(page)
          @page = page
        end

        def call(errors)
          @page.all("form").each do |form|
            submits = form.all("input[type=submit]")
            if submits.empty?
              errors << "Form has no submit button: #{form.path}"
            end
          end
        end

      end
    end
  end
end
