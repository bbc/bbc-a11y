module BBC
  module A11y
    module Standards
      class ImageAlt
        def initialize(page)
          @page = page
        end

        def call(errors)
          @page.all("img:not([alt])").each do |img|
            errors << "<img> tag with no alt attribute (src=\"#{img['src']}\")"
          end
        end

      end
    end
  end
end
