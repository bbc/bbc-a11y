require 'bbc/a11y/configuration'

module BBC::A11y
  describe Configuration do

    before do
      # reset configuration which is held in a class variable
      BBC::A11y.instance_variable_set :@settings, nil
    end

    it "allows you to specify multiple pages" do
      configuration = BBC::A11y.configure do
        page "one.html"
        page "two.html"
      end

      expect(configuration.pages.length).to eq 2
      expect(configuration.pages[0].url).to eq "one.html"
      expect(configuration.pages[1].url).to eq "two.html"
    end

    it "allows you to specify settings for all pages matching a given URL pattern" do
      configuration = BBC::A11y.configure do
        page "three.html" do
          skip_standard /^Foo/
        end
        page "four.html"
        page "five.html"

        for_pages_matching /^f/ do
          skip_standard /^Bar/
        end

        for_pages_matching /^five/ do
          skip_standard /^Baz/
        end
      end

      bar = double(name: "BarStandard")
      baz = double(name: "BazStandard")
      four_page_settings = configuration.pages[1]
      expect(four_page_settings.skip_standard?(bar)).to be_truthy
      five_page_settings = configuration.pages[2]
      expect(five_page_settings.skip_standard?(bar)).to be_truthy
      expect(five_page_settings.skip_standard?(baz)).to be_truthy
    end

  end
end
