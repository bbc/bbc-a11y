module BBC
  module A11y
    module Standards

      class ContentFollowsHeadings
        def initialize(page)
          @page = page
        end

        def call(errors)
          ["h1", "h2", "h3", "h4", "h5", "h6"].each do |h|
            if @page.all("#{h} + #{h}").any?
              errors << "Heading elements must be followed by content. " +
                        "No content follows a #{h}."
            end
          end
        end
      end

    end
  end
end
