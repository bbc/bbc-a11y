# coding: UTF-8
require 'bbc/a11y/configuration'
require 'bbc/a11y/linter'
require 'bbc/a11y/runner'
require 'bbc/a11y/string_colours'
require 'open-uri'
require 'capybara'

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
      rescue Configuration::MissingConfigurationFileError => error
        exit_with_message error.message
      end

      def page_tested(page_settings, lint_result)
        if lint_result.passed?
          stdout.puts green("✓ #{page_settings.url}")
        else
          stdout.puts red("✗ #{page_settings.url}")
          stdout.puts lint_result.errors.map { |error| "  - #{error}" }.join("\n")
        end
        stdout.puts ""
      end

      def all_pages_tested(summary)
        messages = [
          summary_message(summary.pages, 'page', 'checked'),
          summary_message(summary.errors, 'error', 'found'),
          summary_message(summary.skips, 'standard', 'skipped')
        ]
        stdout.puts(messages.join(', '))
        @any_errors = summary.fail?
      end

      private

      def red(message)
        colourize_if_tty(message, :red)
      end

      def green(message)
        colourize_if_tty(message, :green)
      end

      def colourize_if_tty(message, colour)
        if tty?
          message.send(colour)
        else
          message
        end
      end

      def tty?
        (stdout.tty? || ENV['TTY'] == 'true') && ENV['TTY'] != 'false'
      end

      def summary_message(count, noun, verb)
        "#{count} #{noun}#{count == 1 ? '' : 's'} #{verb}"
      end

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
