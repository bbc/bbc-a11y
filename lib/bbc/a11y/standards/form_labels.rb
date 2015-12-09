module BBC
  module A11y
    module Standards
      class FormLabels
        def initialize(page)
          @page = page
        end

        def call(errors)
          fields = @page.all(potential_offenders)
          fields.each do |field|
            if offender? field
              errors << "Field has no label or title attribute: #{field.path}"
            end
          end
        end

        private

        def potential_offenders
          "input:not([title]):not([type='hidden']), textarea:not([title]), select:not([title])"
        end

        def offender?(field)
          (missing_id? field) or (missing_label? field)
        end

        def missing_id?(field)
          field['id'] == nil or field['id'] == ''
        end

        def missing_label?(field)
          @page.all("label[for='#{field['id']}']").empty?
        end

      end
    end
  end
end
