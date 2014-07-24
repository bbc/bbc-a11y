module BBC
  module A11y
    class Settings
      def url
        ENV['URL'] || raise("Please set the URL environment variable to specify the URL to test")
      end
    end
  end
end
