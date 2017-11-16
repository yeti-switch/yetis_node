module YetisNode
  class BaseTransport
    attr_reader :uri, :options
    DEFAULT_TIMEOUT = 5
    CONNECT_TIMEOUT = 5
    READ_TIMEOUT = 30

    def initialize(uri, options = {})
      @uri = uri
      @options = options
    end

    def default_timeout
      options.fetch(:timeout, DEFAULT_TIMEOUT)
    end

    def connect_timeout
      options.fetch(:connect_timeout, CONNECT_TIMEOUT)
    end

    def read_timeout
      options.fetch(:timeout, READ_TIMEOUT)
    end

  end
end
