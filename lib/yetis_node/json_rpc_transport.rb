require 'jrpc'

module YetisNode
  class JsonRpcTransport < BaseTransport

    def rpc_send(method_name, params = [])
      begin
        json_rpc.connect if json_rpc.closed?
        result = json_rpc.perform_request(method_name, params: params)
        json_rpc.close
        result
      rescue ::JRPC::Error => e
        raise Error.new("JSON RPC Error: #{"(#{e.code}) " if e.respond_to?(:code)}#{e.message}")
      end
    end

    def json_rpc
      # TODO: add logger
      @json_rpc ||= ::JRPC::TcpClient.new uri,
                                          namespace: 'yeti.',
                                          timeout: default_timeout,
                                          connect_timeout: connect_timeout,
                                          read_timeout: read_timeout,
                                          connect_retry_count: connect_retry_count
    end

  end
end
