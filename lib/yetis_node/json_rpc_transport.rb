require 'jrpc'
module YetisNode
  class JsonRpcTransport < BaseTransport

    def rpc_send(*args)
      jrpc = json_rpc
      begin
        jrpc.invoke_request(*args)
      rescue ::JRPC::Error => e
        raise Error.new("JSON RPC Error: #{"(#{e.code}) " if e.respond_to?(:code)}#{e.message}")
      ensure
        jrpc.close
      end
    end

    def json_rpc
      ::JRPC::TcpClient.new uri,
                            namespace: 'yeti.',
                            timeout: options.fetch(:timeout, BaseTransport::DEFAULT_TIMEOUT)
    end

  end
end
