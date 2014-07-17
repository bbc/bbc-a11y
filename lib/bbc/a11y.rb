module BBC
  module A11y
    class Configuration < Struct.new(:urls)
    end

    class Test
      def initialize(config)
        @config = config
      end

      def run
        pids = config.urls.map do |url|
          fork {
            exec "URL=#{url} cucumber #{root}/standards-documentation -r #{root}/lib/bbc/a11y/cucumber"
          }
        end
        results = pids.map { |pid| Process.wait2(pid) }
        puts '-' * 20
        total = results.count
        failed_count = results.count { |pid, status| status == 0 }
        passed_count = total - failed_count
        puts "#{total} tests run"
        puts "#{failed_count} failed, #{passed_count} passed"
      end

      def root
        File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
      end

      attr_reader :config
    end
  end
end
