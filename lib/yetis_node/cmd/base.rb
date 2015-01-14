module YetisNode
  module Cmd
    module Base


      def invoke(method, prefix, args = [])
        rpc_send(*([prefix] + method.to_s.split("_") + args.compact))
      end

      def rpc_send(*args)
        begin
          xml_rpc.call_async('di', 'yeti', *args)
        rescue XMLRPC::FaultException => e
           raise Error.new(e.message)
        end    
      end

    end
  end
end