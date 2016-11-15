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

  end
end
