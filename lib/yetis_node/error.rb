module YetisNode
  class Error < RuntimeError
    attr_reader :original

    def initialize(msg, original=$!)
      super(msg)
      @original = original
    end

  end
end