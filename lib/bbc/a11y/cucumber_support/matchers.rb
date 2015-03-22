require 'rspec/matchers'
module BBC
  module A11y
    module CucumberSupport
      RSpec::Matchers.define :have_title_attribute_or_associated_label_tag do
        match do |element|
          if !element['title'].nil?
            return true
          end
          if id = element['id']
            return true if element.find_xpath("//*[for=#{id}]")
          end
          if element.find_xpath("..")[0].name == "label"
            return true
          end
          false
        end
      end
    end
  end
end
