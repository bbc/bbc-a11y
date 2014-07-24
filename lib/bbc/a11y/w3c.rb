require 'w3c_validators'
module BBC
  module A11y

    class W3C
      include W3CValidators

      def initialize
        @validator = MarkupValidator.new(options)
      end

      def validate(url)
        @results = @validator.validate_uri(url)
      end

      def errors
        @results.errors
      end

      private

      def options
        return {} unless proxy
        { proxy_server: proxy, proxy_port: 80 }
      end

      def proxy
        @proxy ||= ['http_proxy', 'https_proxy', 'HTTP_PROXY', 'HTTPS_PROXY'].map { |key| ENV[key] }.compact.first
      end
    end

  end
end
