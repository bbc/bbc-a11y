module BBC
  module A11y
    module Standards
      class TabIndex
        def initialize(page)
          @page = page
        end

        def call(errors)
          offenders = @page.all("*[tabindex='0']").reject { |el|
            ['input', 'button', 'select', 'textarea', 'a'].include? el.tag_name
          }
          offenders.each do |el|
            errors << "tabindex=\"0\" must not be used on <#{el.tag_name}> " +
                      "elements (not focusable by default)"
          end
        end

      end
    end
  end
end
