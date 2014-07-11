module ValidatorWorld
  def w3c
    @w3c ||= W3C.new
  end

  def url
    ENV['URL'] || raise("Please set the URL environment variable to specify the URL to test")
  end

  require 'w3c_validators'
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

World(ValidatorWorld)
