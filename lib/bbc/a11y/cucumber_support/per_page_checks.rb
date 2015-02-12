module BBC
  module A11y
    module CucumberSupport
      module PerPageChecks
        def assert_title_describes_primary_content_of_document(title, page)
          pending <<-ERROR
Because the title did not contain the header text, you need to write a custom
method to define how to make this check.

In your .a11y.rb file, add the following code:

BBC::A11y.configure do
  page "my_page.html" do

    customize_world do
      def assert_title_describes_primary_content_of_document(title, page)
        # TODO: add your custom code here to make the check
      end
    end

  end
end
          ERROR
        end
      end
    end
  end
end
