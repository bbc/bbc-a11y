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

        def initialize(before_all_hooks = [], after_all_hooks = [], pages = [])
          @before_all_hooks = before_all_hooks
          @after_all_hooks = after_all_hooks
          @pages = pages
          freeze
        end

        def with_pages(new_pages)
          self.class.new(before_all_hooks, after_all_hooks, new_pages)
        end
      end

      class PageSettings
        attr_reader :url, :scenarios_to_skip, :world_extensions

        def initialize(url, scenarios_to_skip = [], world_extensions = [])
          @url = url
          @scenarios_to_skip = scenarios_to_skip
          @world_extensions = world_extensions
          freeze
        end

        def skip_test_case?(test_case)
          @scenarios_to_skip.any? { |pattern| pattern.match test_case.name }
        end

        def merge(other)
          self.class.new(url, scenarios_to_skip + other.scenarios_to_skip, world_extensions + other.world_extensions)
        end
      end

      class DSL
        attr_reader :settings
        def initialize(block)
          @settings = Settings.new
          @general_page_settings = []
          instance_eval &block
          @settings = settings.with_pages(apply_general_settings(settings.pages))
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

        def for_pages_matching(url, &block)
          @general_page_settings << PageDSL.new(url, block).settings
        end

        private

        def apply_general_settings(all_page_settings)
          all_page_settings.map { |page_settings|
            matching_general_settings = @general_page_settings.select { |general_page_settings| general_page_settings.url.match page_settings.url }
            matching_general_settings.reduce(page_settings) { |page_settings, general_page_settings|
              page_settings.merge(general_page_settings)
            }
          }
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
