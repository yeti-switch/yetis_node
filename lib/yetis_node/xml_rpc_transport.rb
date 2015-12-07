require 'xmlrpc/client'
module YetisNode
  class XmlRpcTransport < BaseTransport


    def rpc_send(*args)
      xml_rpc.call_async('di', 'yeti', *args)
    rescue XMLRPC::FaultException => e
      raise Error.new(e.message)
    end

    def xml_rpc
      @xml_rpc ||= XMLRPC::Client.new2 uri, options.fetch(:timeout, BaseTransport::DEFAULT_TIMEOUT)
    end

  end
end
