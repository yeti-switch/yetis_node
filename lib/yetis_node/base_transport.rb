module YetisNode
  class BaseTransport
    attr_reader :uri, :options
    DEFAULT_TIMEOUT = 5

    def initialize(uri, options = {})
      @uri = uri
      @options = options
    end

  end
end
