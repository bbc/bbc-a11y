require 'rspec/expectations'
require 'capybara/rspec/matchers'
require 'bbc/a11y/cucumber_support/heading_hierarchy'

module BBC
  module A11y
    module CucumberSupport

      class Page

        include RSpec::Matchers
        include Capybara::RSpecMatchers

        def initialize(browser)
          @browser = browser
        end

        def title
          browser.title
        end

        def all_elements_matching(*selectors)
          results = selectors.map { |selector| browser.all(selector) }
          # A Capybara::Result looks like an array, but it's not. Turn them into plain
          # old nodes
          results.map { |result| result.map { |element| element } }.flatten
        end

        def must_have_lang_attribute
          expect(browser).to have_css('html[lang]')
        end

        def must_have_lang_attribute_of(expected_code)
          expect(browser.find('html')['lang'].split('-')[0]).to eq expected_code
        end

        def must_have_title
          expect(browser.title).not_to be_empty
        end

        def must_have_title_that_contains_h1_text
          expect(browser.title).to include(browser.find('h1').text)
        end

        def must_have_one_main_element
          expect(browser.all('[role="main"]').length).to eq 1
        end

        def must_have_one_h1
          expect(browser.all('h1', visible: false).length).to eq 1
        end

        def must_have_correct_heading_hierarchy
          heading_hierarchy.validate
        end

        def must_have_no_elements_with_title_attribute_content_repeated_within
          bad_nodes = browser.all('[title]').select { |node| node.text.include? node['title'] }
          expect(bad_nodes).to be_empty
        end

        def must_have_no_form_fields_with_label_and_title
          bad_nodes = browser.all('form *[id][title]').select { |node| browser.has_css?("label[for='#{node['id']}']") }
          expect(bad_nodes).to be_empty
        end

        def must_not_have_any_elements_with_tabindex_greater_than(max)
          bad_nodes = browser.all('[tabindex]').select { |node| node['tabindex'].to_i > max }
          expect(bad_nodes).to be_empty
        end

        def must_not_have_elements_with_tabindex(tabindex, except: [])
          nodes_with_tabindex = browser.all('[tabindex]').select { |node| node['tabindex'].to_i == tabindex }
          bad_nodes = nodes_with_tabindex.reject { |node| except.include? node.tag_name }
          expect(bad_nodes).to be_empty
        end

        def to_s
          browser.text
        end

        def heading_hierarchy
          HeadingHierarchy.new(browser)
        end

        private

        attr_reader :browser
        private :browser
      end

    end
  end
end
