module BBC
  module A11y
    module Standards
      class TitleAttribute
        def initialize(page)
          @page = page
        end

        def call(errors)
          @page.all("[title]").each do |element|
            unless form_input? element
              errors << "Element (not a form input) has a title " +
                        "attribute: #{element.path}"
            end
          end
        end

        private

        def form_input?(element)
          form_input_tags.include? element.tag_name.downcase
        end

        def form_input_tags
          ['input', 'button', 'select', 'textarea']
        end

      end
    end
  end
end
