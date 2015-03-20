require 'forwardable'
require 'cucumber'
require 'bbc/a11y/cucumber_support'
require 'cucumber/core/filter'
require 'colorize'

module BBC
  module A11y
    module ConsoleWriter
      def underline(text, character="-")
        [text, character * text.length].join("\n")
      end

      def indent(spaces, text)
        text.split("\n").map { |line| (" " * spaces) + line }.join("\n")
      end
    end

    class CucumberFormatter
      include ConsoleWriter

      def initialize(*args)
        @current_feature = nil
      end

      def before_test_case(test_case)
        on_new_feature(test_case) do |feature|
          puts
          puts underline(feature.name)
          puts
        end
        print "  - #{test_case.name}... "
        @step_results = []
      end

      def after_test_step(test_step, result)
        @step_results << [test_step, result]
      end

      def after_test_case(test_case, result)
        colour = ResultColour.new(result)
        print colour.apply_to(result.to_s)
        if !result.passed?
          puts
          puts
          print_scenario
          puts
          puts indent(4, colour.apply_to(result.exception.message.to_s))
          if result.failed?
            puts indent(4, colour.apply_to(result.exception.backtrace.join("\n")))
          end
        end
        puts
        if result.failed?
          CucumberRunner.failed_count += 1
        end
      end

      private

      def print_scenario
        @step_results.each do |step, result|
          step.describe_source_to(StepsPrinter.new, result)
        end
      end

      def colour(result)
        ResultColour.new(result).apply_to(result.to_s)
      end

      def on_new_feature(test_case)
        feature = test_case.source.first
        if feature != @current_feature
          @current_feature = feature
          yield feature
        end
      end

      class StepsPrinter
        include ConsoleWriter

        def before_hook(*)
        end

        def scenario(*)
        end

        def feature(*)
        end

        def after_hook(*)
        end

        def step(step, result)
          colour = ResultColour.new(result)
          puts indent(6, colour.apply_to("#{step.keyword}#{step.name}"))
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
      include ConsoleWriter
      FEATURES_PATH = File.expand_path(File.dirname(__FILE__) + "/../../../standards")

      class << self
        # need to use a global stash-point for the formatter to talk back to use
        # until Cucumber gives us a way to add formatter instances that we can
        # share.
        def failed_count
          @failed_count ||= 0
        end
      end

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
        raise BBC::A11y::TestsFailed if self.class.failed_count > 0
      end

      private

      def configuration
        return @configuration if @configuration
        @configuration = Cucumber::Cli::Configuration.new
        if !@cucumber_args.any?
          @cucumber_args = [FEATURES_PATH]
        end
        # This is ugly, but until Cucumber offers a better API, we have to pass in our settings as though
        # they were CLI arguments
        @configuration.parse!(@cucumber_args + 
                              ["--format", "BBC::A11y::CucumberFormatter"])
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
        puts underline("BBC Accesibility: #{page_settings.url}")
      end

    end

  end
end
