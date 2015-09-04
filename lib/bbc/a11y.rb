module BBC
  module A11y
    TestsFailed = Class.new(StandardError)

    def self.current_version
      @current_version ||= File.read(File.dirname(__FILE__) + '/a11y/version')
    end

    def self.until_version(max_version)
      if current_version >= max_version
        raise "DEAD CODE: #{caller[0]}"
      end
      yield
    end

  end
end
