require 'bbc/a11y/configuration'
require 'bbc/a11y'

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

      def call(runner)
        trap_interrupt
        runner.new(settings, cucumber_args).call
      rescue TestsFailed
        exit 1
      rescue MissingArgument => error
        exit_with_message "You missed an argument: #{error.message}", HELP
      end

      private

      def settings
        return Configuration.for_urls(a11y_args) if a11y_args.any?
        A11y.until_version('0.1.0') do
          exit_with_message "Please rename your .a11y.rb configuration file to a11y.rb" if File.exist?(".a11y.rb")
        end
        Configuration.parse(File.expand_path("a11y.rb"))
      end

      def a11y_args
        if args.find_index('--')
          args[0..(args.find_index('--') - 1)]
        else
          args
        end
      end

      def cucumber_args
        return [] unless args.include?('--')
        args[(args.find_index('--') + 1)..-1]
      end

      def trap_interrupt
        trap('INT') do
          exit!(1) if Cucumber.wants_to_quit
          Cucumber.wants_to_quit = true
          STDERR.puts "\nExiting... Interrupt again to exit immediately."
        end
      end

      def exit_with_message(*messages)
        messages.each { |message| puts message }
        raise SystemExit
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
