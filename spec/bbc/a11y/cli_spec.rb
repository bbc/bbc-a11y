require 'bbc/a11y/cli'

module BBC
  module A11y
    describe CLI do
      it "uses a single URL from the CLI args if given" do
        runner = double
        expect(runner).to receive(:new) do |settings, cucumber_args|
          expect(settings.pages.length).to eq 1
          expect(settings.pages[0].url).to eq "http://foo.com"
          double(call: nil)
        end
        CLI.new(double, double, double, ["http://foo.com"]).call(runner)
      end

      it "splits a11y and cucumber args" do
        runner = double
        expect(runner).to receive(:new) do |settings, cucumber_args|
          expect(settings.pages.length).to eq 1
          expect(cucumber_args).to eq ["--tags", "~@wip"]
          double(call: nil)
        end
        CLI.new(double, double, double, ["http://foo.com", "--", "--tags", "~@wip"]).call(runner)
      end
    end
  end
end
