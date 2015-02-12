require 'bbc/a11y/cucumber_runner'
require 'bbc/a11y/configuration'

module BBC
  module A11y

    # A very thin wrapper around Cucumber which takes settings on the command-line,
    # stores them somewhere our automation code will be able to find it, and then
    # runs Cucumber
    class CLI
      MissingArgument = Class.new(StandardError)

      def initialize(stdin, stdout, stderr, args)
        @stdin, @stdout, @stderr, @args = stdin, stdout, stderr, args
      end

      def call
        CucumberRunner.new(settings, cucumber_args).call
      rescue MissingArgument => error
        stderr.puts "You missed an argument: #{error.message}"
        stderr.puts HELP
        raise SystemExit
      end

      private

      def settings
        Configuration.parse(File.expand_path(".a11y.rb"))
      end

      def cucumber_args
        return unless args.include?('--')
        args[args.find_index('--')+1..-1]
      end

      attr_reader :stdin, :stderr, :stdout, :args
      private :stdin, :stderr, :stdout, :args

      HELP = %{
Usage: a11y [-- cucumber-args]

cucumber-args   - Arguments to pass to Cucumber when running the tests. See cucumber --help
                  for details.
}

    end
  end
end
