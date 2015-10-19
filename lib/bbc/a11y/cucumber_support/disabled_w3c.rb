module BBC
  module A11y
    module CucumberSupport

      class DisabledW3C

        def validate(url)
          raise Cucumber::Core::Test::Result::Skipped.new <<-MESSAGE
W3C validation is disabled by default as it makes off-network calls
to the W3C web service and can be slow and unreliable.

To enable these checks, include the following code in your a11y.rb
config file:

    BBC::A11y.configure do
      page "my_page.html" do

        customize_world do
          def w3c
            @w3c ||= BBC::A11y::CucumberSupport::W3C.new
          end
        end

      end
    end
          MESSAGE
        end

        def errors
          []
        end

      end

    end
  end
end
