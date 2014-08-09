module BBC
  module A11y
    class HeadingHierarchy
      include RSpec::Matchers

      def initialize(page)
        @page = page
      end

      def validate
        adjacent_pairs = headings.zip(headings[1..-1])[0..-2]
        errors = adjacent_pairs.reduce([]) { |errors, pair|
          previous, current = *pair
          if current > previous
            delta = current.number - previous.number
            if delta != 1
              errors << current
            end
          end
          errors
        }
        expect(errors).to be_empty, error_message(errors)
      end

      private

      def error_message(errors)
        "Headings were not in order: " + 
          headings.map { |h| errors.include?(h) ? "**#{h}**" : h }.
          join(", ")
      end

      def headings
        heading_elements.map { |h| Heading.new(h) }
      end

      def heading_elements
        page.all(:xpath, "//*[substring(name(), 1, 1) = 'h' and substring(name(), 2, 1) >= 1 and substring(name(), 2, 1) <= 6]").to_a
      end

      attr_reader :page
      private :page

      class Heading
        attr_reader :number

        def initialize(element)
          @element = element
          @tag_name = element.tag_name
          @number = @tag_name[1].to_i
        end

        def > (other)
          number > other.number
        end

        def == (other)
          other.element.path == @element.path
        end

        def to_s
          @tag_name
        end

        attr_reader :element
        protected :element
      end
    end
  end
end
