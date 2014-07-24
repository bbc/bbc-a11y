module BBC
  module A11y
    class CLI
      MissingArgument = Class.new(StandardError)

      def initialize(stdin, stdout, stderr, args)
        @stdin, @stdout, @stderr, @args = stdin, stdout, stderr, args
      end

      def call
        ENV['URL'] = url
        exec("cucumber")
      rescue MissingArgument => error
        stderr.puts "Missing argument: #{error.message}"
        stderr.puts HELP
        raise SystemExit
      end

      private

      def url
        args[0] || raise(MissingArgument.new("url"))
      end

      attr_reader :stdin, :stderr, :stdout, :args
      private :stdin, :stderr, :stdout, :args

      HELP = %{
Usage: a11y url
}

    end
  end
end
