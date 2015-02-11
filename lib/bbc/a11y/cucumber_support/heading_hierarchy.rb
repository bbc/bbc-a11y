module BBC
  module A11y
    module CucumberSupport

      class HeadingHierarchy
        include RSpec::Matchers

        def initialize(page)
          @page = page
        end

        def validate
          return self unless headings.count > 1
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
          self
        end

        def to_s
          headings.map { |h|
            indent = "  " * (h.number - 1)
            indent + h.to_s
          }.join("\n")
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
          # can't work out how to get Capybara to do this reliably, so we'll reach down to the XML parser
          xml = Nokogiri::XML.parse(page.source).remove_namespaces!
          header_xml_nodes = xml.xpath('//*[substring(name(),1,1) = "h" and number(substring(name(),2,1))]')
          header_xml_nodes.map(&:path).map { |xpath|
            page.find(:xpath, xpath, visible: false)
          }
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
            begin
              other.element.path == @element.path
            rescue NotSupportedByDriverError
              other.element == @element
            end
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
end
