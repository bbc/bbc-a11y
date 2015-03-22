require 'bbc/a11y/configuration'

module BBC::A11y
  describe Configuration do

    before do
      # reset configuration which is held in a class variable
      BBC::A11y.instance_variable_set :@settings, nil
    end

    it "allows you to specify multiple pages" do
      BBC::A11y.configure do
        page "one.html"
        page "two.html"
      end

      expect(BBC::A11y.configuration.pages.length).to eq 2
      expect(BBC::A11y.configuration.pages[0].url).to eq "one.html"
      expect(BBC::A11y.configuration.pages[1].url).to eq "two.html"
    end

    it "allows you to specify scenarios to be skipped for a given page (using regexp)" do
      BBC::A11y.configure do
        page "three.html" do
          skip_scenario /javascript/
        end
      end

      page_settings = BBC::A11y.configuration.pages[0]
      test_case = double(name: "View the page with javascript disabled")
      expect(page_settings.skip_test_case?(test_case)).to be_truthy
    end

    it "allows you to specify scenarios to be skipped for a given page (using string)" do
      BBC::A11y.configure do
        page "three.html" do
          skip_scenario "javascript"
        end
      end

      page_settings = BBC::A11y.configuration.pages[0]
      test_case = double(name: "View the page with javascript disabled")
      expect(page_settings.skip_test_case?(test_case)).to be_truthy
    end

    it "allows you to specify settings for all pages matching a given URL pattern" do
      BBC::A11y.configure do
        page "three.html" do
          skip_scenario /^foo/
        end
        page "four.html"
        page "five.html"

        for_pages_matching /^f/ do
          skip_scenario /^bar/
        end

        for_pages_matching /^five/ do
          skip_scenario /^baz/
        end
      end

      bar = double(name: "bar_page.html")
      baz = double(name: "baz_page.html")
      four_page_settings = BBC::A11y.configuration.pages[1]
      expect(four_page_settings.skip_test_case?(bar)).to be_truthy
      five_page_settings = BBC::A11y.configuration.pages[2]
      expect(five_page_settings.skip_test_case?(bar)).to be_truthy
      expect(five_page_settings.skip_test_case?(baz)).to be_truthy
    end

  end
end

