require 'bbc/a11y/cli'

module BBC
  module A11y
    describe CLI do
      let(:runner) { double }
      let(:stdout) { double(puts: nil) }
      let(:stdin)  { double(puts: nil) }
      let(:stderr) { StringIO.new }

      def run(args = [])
        CLI.new(stdin, stdout, stderr, args).call
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
