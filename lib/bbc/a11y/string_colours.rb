module BBC
  module A11y
    module StringColours
      def red
        "\e[31m#{self}\e[0m"
      end

      def green
        "\e[32m#{self}\e[0m"
      end
    end
  end
end

String.send(:include, BBC::A11y::StringColours)
