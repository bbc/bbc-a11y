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

      def call(runner)
        trap_interrupt
        runner.new(settings, cucumber_args).call
      rescue MissingArgument => error
        stderr.puts "You missed an argument: #{error.message}"
        stderr.puts HELP
        raise SystemExit
      end

      private

      def settings
        if a11y_args.any?
          Configuration.for_urls(a11y_args)
        else
          Configuration.parse(File.expand_path(".a11y.rb"))
        end
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
