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
        ENV['URL'] = url
        exec("cucumber #{cucumber_args}")
      rescue MissingArgument => error
        stderr.puts "You missed an argument: #{error.message}"
        stderr.puts HELP
        raise SystemExit
      end

      private

      def url
        args[0] || raise(MissingArgument.new("url-to-test"))
      end

      def cucumber_args
        args[args.find_index('--')+1..-1].join(' ')
      end

      attr_reader :stdin, :stderr, :stdout, :args
      private :stdin, :stderr, :stdout, :args

      HELP = %{
Usage: a11y url-to-test [-- cucumber-args]

url-to-test     - URL of the page to run the full set of accessiblity tests against
cucumber-args   - Arguments to pass to Cucumber when running the tests. See cucumber --help
                  for details.
}

    end
  end
end
