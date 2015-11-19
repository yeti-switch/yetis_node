require 'forwardable'
module YetisNode


  # node = YetisNode::Client.new('http://10.10.10.10:8090')
  # <YetisNode::Client:0x007f9d8b8b46f8 @uri="http://10.10.10.10:8090", @options={}>
  # node.calls_count
  # => "10"
  class Client
    extend Forwardable

    attr_reader :uri, :options

    def_delegators :@transport, :rpc_send

    def initialize(uri, options = {})
      @uri = uri
      @options = options
      select_transport!
    end

    include Cmd::Base
    include Cmd::Show
    include Cmd::Request
    include Cmd::Set

    protected :invoke_show, :invoke_request, :invoke_set

    private

    def select_transport!
      transport_klass = case @options.fetch(:transport, :xml_rpc)
                          when :xml_rpc
                            XmlRpcTransport
                          when :json_rpc
                            JsonRpcTransport
                          else
                            raise Error.new('invalid transport')
                        end

      @transport = transport_klass.new(@uri, @options)
    end

  end
end
  