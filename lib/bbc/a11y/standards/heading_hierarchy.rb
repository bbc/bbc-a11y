module BBC
  module A11y
    module Standards

      class HeadingHierarchy
        def initialize(page)
          @page = page
        end

        def call(errors)
          heading_levels.each_cons(2).each do |pair|
            if pair.last > pair.first + 1
              errors << "Headings were not in order: " +
                        "h#{pair.first} is followed by h#{pair.last}"
            end
          end
        end

        private

        def headings
          @page.all('h1, h2, h3, h4, h5, h6', visible: false)
        end

        def heading_levels
          headings.map do |heading|
            heading.tag_name[1].to_i
          end
        end
      end

    end
  end
end
