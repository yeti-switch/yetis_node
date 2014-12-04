module YetisNode
  module Cmd
    module Request

      def resolver_clear
        invoke_request
      end

      def call_disconnect(*args)
        invoke_request(args)
      end

      def invoke_request(args = [])
        invoke(caller_locations(1, 1)[0].label, 'request', args)
      end

    end
  end
end