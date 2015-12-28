module BBC
  module A11y
    class Javascript
      def self.bundle
        @@bundle ||= File.read(bundle_path)
      end

      def self.bundle_path
        File.expand_path("../js/bundle.js", __FILE__)
      end
    end
  end
end
