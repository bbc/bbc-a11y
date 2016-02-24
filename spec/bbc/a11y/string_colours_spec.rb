require 'bbc/a11y/string_colours'

module BBC::A11y
  describe StringColours do
    it "makes strings red" do
      expect("red".red).to eql("\e[31mred\e[0m")
    end

    it "makes strings green" do
      expect("green".green).to eql("\e[32mgreen\e[0m")
    end
  end
end
