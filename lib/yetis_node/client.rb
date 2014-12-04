require 'xmlrpc/client'
module YetisNode


  # node = YetisNode::Client.new('http://10.10.10.10:8090')
  # <YetisNode::Client:0x007f9d8b8b46f8 @uri="http://10.10.10.10:8090", @options={}>
  # node.calls_count
  # => "10"
  class Client
    attr_reader :uri

    DEFAULT_TIMEOUT = 10

    def initialize(uri, options = {})
      @uri = uri
      @options = options
    end

    include Cmd::Base
    include Cmd::Show
    include Cmd::Request
    include Cmd::Set


    protected :invoke_show, :invoke_request, :invoke_set

    protected

    def xml_rpc
      @xml_rpc ||= XMLRPC::Client.new2(uri, @options.fetch(:proxy, nil), @options.fetch(:timeout, DEFAULT_TIMEOUT))
    end


  end
end
  