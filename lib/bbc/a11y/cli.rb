# coding: UTF-8
require 'bbc/a11y/configuration'
require 'bbc/a11y/linter'
require 'bbc/a11y/runner'
require 'open-uri'
require 'capybara'
require 'colorize'

module BBC
  module A11y

    class CLI
      def initialize(stdin, stdout, stderr, args)
        @stdin, @stdout, @stderr, @args = stdin, stdout, stderr, args
      end

      def call
        Runner.new(settings, self).run
        exit 1 if @any_errors
      rescue Configuration::ParseError => error
        exit_with_message error.message
      end

      def page_tested(page_settings, errors)
        if errors.empty?
          stdout.puts "✓ #{page_settings.url}".colorize(:green)
        else
          stdout.puts "✗ #{page_settings.url}".colorize(:red)
          stdout.puts errors.map { |error| "  - #{error}" }.join("\n")
        end
        stdout.puts ""
      end

      def all_pages_tested(summary)
        stdout.puts "Tested #{summary.pages} pages, errors: #{summary.errors}, skipped: #{summary.skips}"
        @any_errors = summary.fail?
      end

      private

      def settings
        return Configuration.for_urls(@args) if @args.any?
        configuration_file = File.expand_path("a11y.rb")
        Configuration.parse(configuration_file)
      end

      def exit_with_message(*messages)
        messages.each { |message| stderr.puts message }
        exit 1
      end

      attr_reader :stdin, :stderr, :stdout, :args
      private :stdin, :stderr, :stdout, :args

      HELP = %{
Usage: a11y [url]
}

    end
  end
end
