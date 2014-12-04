module YetisNode
  module Cmd
    module Base


      def invoke(method, prefix, args = [])
        rpc_send(*([prefix] + method.to_s.split("_") + args.compact))
      end

      def rpc_send(*args)
        result = xml_rpc.call_async('di', 'yeti', *args)
        if result.is_a?(Array)
          raise Error.new("Yeti RPC ERROR: #{result[0]}") unless  (200..299) === result[0].to_i
          result[1]
        else
          raise Error.new("Yeti RPC ERROR: Unexpected result")
        end
      end

    end
  end
end