module BBC
  module A11y

    def self.configure(&block)
      dsl = Configuration::DSL.new
      dsl.instance_eval &block
      @settings = dsl.settings
    end

    def self.configuration
      @settings ||= Configuration::Settings.new
    end

    module Configuration
      def self.parse(file)
        require file
        BBC::A11y.configuration
      end

      class Settings
        def before_all_hooks
          @before_all_hooks ||= []
        end

        def after_all_hooks
          @after_all_hooks ||= []
        end

        def pages
          @pages ||= []
        end
      end

      class PageSettings
        attr_reader :url

        def initialize(url)
          @url = url
        end
      end

      class DSL
        def before_all(&block)
          settings.before_all_hooks << block
        end

        def after_all(&block)
          settings.after_all_hooks << block
        end

        def page(url)
          settings.pages << PageSettings.new(url)
        end

        def settings
          @settings ||= Settings.new
        end
      end
    end

  end
end
