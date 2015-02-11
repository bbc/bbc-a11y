require 'cucumber'
require 'bbc/a11y/cucumber_support'
require 'cucumber/core/filter'
require 'colorize'

module BBC
  module A11y
    class CucumberFormatter
      def initialize(*args)
      end

      def before_test_case(test_case)
        print "#{test_case.name} "
      end

      def after_test_case(test_case, result)
        print result
        if result.failed?
          puts
          puts result.exception.to_s.red
          puts result.exception.backtrace.join("\n").red
        end
        puts
      end

    end

    class CucumberRunner
      def initialize(settings, cucumber_args)
        @settings = settings
      end

      def call
        runtime = Cucumber::Runtime.new(configuration)
        run_before_all_hooks
        @settings.pages.each do |page_settings|
          BBC::A11y::CucumberSupport.current_page_settings = page_settings

          puts
          puts "BBC Accesibility: #{page_settings.url}"
          puts "=" * "BBC Accesibility: #{page_settings.url}".length
          puts

          runtime.run!
        end
      ensure
        run_after_all_hooks
      end

      private

      def configuration
        return @configuration if @configuration
        features_path = File.expand_path(File.dirname(__FILE__) + "/../../../features")
        @configuration = Cucumber::Cli::Configuration.new
        # This is ugly, but until Cucumber offers a better API, we have to pass in our settings as though
        # they were CLI arguments
        @configuration.parse!([
                              features_path,
                              "--format", "BBC::A11y::CucumberFormatter"])
        @configuration
      end

      def run_before_all_hooks
        @settings.before_all_hooks.each &:call
      end

      def run_after_all_hooks
        @settings.after_all_hooks.each &:call
      end

    end
  end
end
