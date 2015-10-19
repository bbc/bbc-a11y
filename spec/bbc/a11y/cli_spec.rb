require 'bbc/a11y/cli'

module BBC
  module A11y
    describe CLI do
      let(:runner) { double }
      let(:stdout) { double(puts: nil) }
      let(:stdin)  { double(puts: nil) }
      let(:stderr) { StringIO.new }

      def run(args = [])
        CLI.new(stdin, stdout, stderr, args).call(runner)
      end

      it "uses a single URL from the CLI args if given" do
        expect(runner).to receive(:new) do |settings, cucumber_args|
          expect(settings.pages.length).to eq 1
          expect(settings.pages[0].url).to eq "http://foo.com"
          double(call: nil)
        end
        run ["http://foo.com"]
      end

      it "splits a11y and cucumber args" do
        expect(runner).to receive(:new) do |settings, cucumber_args|
          expect(settings.pages.length).to eq 1
          expect(cucumber_args).to eq ["--tags", "~@wip"]
          double(call: nil)
        end
        run ["http://foo.com", "--", "--tags", "~@wip"]
      end

      context "if the configuration fails to parse" do
        before do
          allow(Configuration).to receive(:parse).and_raise(Configuration::ParseError)
        end

        it "raises a SystemExit" do
          expect { run }.to raise_error(SystemExit)
        end

        it "prints the error to the console" do
          begin
            run
          rescue SystemExit
          end
          expect(stderr.string).to match(/There was an error reading your configuration file/)
        end
      end
    end
  end
end
