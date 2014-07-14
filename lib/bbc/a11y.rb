module BBC
  module A11y
    class Configuration < Struct.new(:urls)
    end

    class Test
      def initialize(config)
        @config = config
      end

      def run
        config.urls.each do |url|
          exec("URL=#{url} cucumber /Users/matt/projects/a11y/standards-documentation -r /Users/matt/projects/a11y/lib/bbc/a11y/cucumber")
        end
      end

      attr_reader :config
    end
  end
end
