require 'cucumber/runtime'
require 'bbc/a11y/cucumber_support'

module BBC
  module A11y
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
        features_path = File.expand_path(File.dirname(__FILE__) + "/../../../features")
        configuration = Cucumber::Cli::Configuration.new
        configuration.parse!([features_path])
        configuration
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
