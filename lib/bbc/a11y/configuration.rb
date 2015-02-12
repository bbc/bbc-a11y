module BBC
  module A11y

    def self.configure(&block)
      @settings = Configuration::DSL.new(block).settings
    end

    def self.configuration
      @settings ||= Configuration::Settings.new
    end

    module Configuration
      def self.parse(file)
        require file
        # the file should call BBC::A11y.configure
        BBC::A11y.configuration
      end

      class Settings
        attr_reader :before_all_hooks,
          :after_all_hooks,
          :pages

        def initialize
          @before_all_hooks = []
          @after_all_hooks = []
          @pages = []
          freeze
        end
      end

      class PageSettings
        attr_reader :url, :scenarios_to_skip, :world_extensions

        def initialize(url)
          @url = url
          @scenarios_to_skip = []
          @world_extensions = []
          freeze
        end
      end

      class DSL
        attr_reader :settings
        def initialize(block)
          @settings = Settings.new
          instance_eval &block
        end

        def before_all(&block)
          settings.before_all_hooks << block
        end

        def after_all(&block)
          settings.after_all_hooks << block
        end

        def page(url, &block)
          settings.pages << PageDSL.new(url, block).settings
        end
      end

      class PageDSL
        attr_reader :settings

        def initialize(url, block)
          @settings = PageSettings.new(url)
          instance_eval &block if block
        end

        def skip_scenario(name)
          @settings.scenarios_to_skip << name
        end

        def customize_world(&block)
          @settings.world_extensions << Module.new(&block)
        end
      end

    end

  end
end
