module YetisNode
  module Cmd
    module Set

      def invoke_set(args = [])
        invoke(caller_locations(1, 1)[0].label, 'set', args)
      end

    end
  end
end
