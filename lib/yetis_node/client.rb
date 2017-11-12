require 'forwardable'
module YetisNode


  # node = YetisNode::Client.new('http://10.10.10.10:8090')
  # <YetisNode::Client:0x007f9d8b8b46f8 @uri="http://10.10.10.10:8090", @options={}>
  # node.calls_count
  # => "10"
  class Client
    extend Forwardable

    attr_reader :uri, :options, :transport

    def_delegators :@transport, :rpc_send

    def initialize(uri, options = {})
      @uri = uri
      @options = options
      @transport = JsonRpcTransport.new(@uri, @options)
    end

    include Cmd::Base
    include Cmd::Show
    include Cmd::Request
    include Cmd::Set

    protected :invoke_show, :invoke_request, :invoke_set

  end
end
