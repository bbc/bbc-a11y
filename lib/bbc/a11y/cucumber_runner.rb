require 'forwardable'
require 'cucumber'
require 'bbc/a11y/cucumber_support'
require 'cucumber/core/filter'
require 'colorize'

module BBC
  module A11y
    class CucumberFormatter
      def initialize(*args)
        @current_feature = nil
      end

      def before_test_case(test_case)
        on_new_feature(test_case) do |feature|
          puts
          puts "#{feature.name}"
          puts "#{"-" * feature.name.length}"
          puts
        end
        print "  - #{test_case.name}... "
      end

      def after_test_case(test_case, result)
        colour = ResultColour.new(result)
        print colour.apply_to(result.to_s)
        if result.failed? || result.pending? || result.skipped?
          puts
          puts
          puts indent(4, colour.apply_to(result.exception.message.to_s))
          puts indent(4, colour.apply_to(result.exception.backtrace.join("\n")))
        end
        puts
      end

      private

      def colour(result)
        ResultColour.new(result).apply_to(result.to_s)
      end

      def indent(spaces, text)
        text.split("\n").map { |line| (" " * spaces) + line }.join("\n")
      end

      def on_new_feature(test_case)
        feature = test_case.source.first
        if feature != @current_feature
          @current_feature = feature
          yield feature
        end
      end

      class ResultColour
        def initialize(result)
          @color = :white
          result.describe_to(self)
        end

        def passed
          @color = :green
        end

        def skipped
          @color = :blue
        end

        def pending(*)
          @color = :yellow
        end

        def failed
          @color = :red
        end

        def undefined
          @color = :yellow
        end

        def duration(*)
        end

        def exception(*)
        end

        def apply_to(string)
          string.send(@color)
        end
      end

    end

    class CucumberRunner
      def initialize(settings, cucumber_args)
        @settings = settings
        @cucumber_args = cucumber_args
      end

      def call
        runtime = Cucumber::Runtime.new(configuration)
        run_before_all_hooks
        @settings.pages.each do |page_settings|
          # stash the settings where the support code will find them
          BBC::A11y::CucumberSupport.current_page_settings = page_settings
          print_page_header page_settings
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
        @configuration.parse!(@cucumber_args + [
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

      def print_page_header(page_settings)
        puts
        puts
        puts "BBC Accesibility: #{page_settings.url}"
        puts "=" * "BBC Accesibility: #{page_settings.url}".length
      end

    end

  end
end
