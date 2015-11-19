module YetisNode
  module Cmd
    module Base

      def invoke(method, prefix, args = [])
        rpc_send(*([prefix] + method.to_s.split('_') + args.compact))
      end

    end
  end
end
