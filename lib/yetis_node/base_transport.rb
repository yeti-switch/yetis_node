module YetisNode
  class BaseTransport

    DEFAULT_TIMEOUT = 5
    CONNECT_TIMEOUT = 5
    READ_TIMEOUT = 30
    CONNECT_RETRY_COUNT = 10

    attr_reader :uri, :options

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

    def connect_retry_count
      options.fetch(:connect_retry_count, CONNECT_RETRY_COUNT)
    end

  end
end
