module BBC
  module A11y
    module Standards
      class AnchorHrefs
        def initialize(page)
          @page = page
        end

        def call(errors)
          @page.all("a:not([href])").each do |anchor|
            errors << "Anchor has no href attribute: #{anchor.path}"
          end
        end

      end
    end
  end
end
