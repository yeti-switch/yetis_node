module YetisNode
  module Cmd
    module Show

      # show calls
      # show calls <LOCAL-TAG>
      # show calls count
      # show calls filtered <field1> <field2> ...
      # show configuration
      # show interfaces
      # show media streams
      # show registrations
      # show registrations <id>
      # show registrations count
      # show resource state <type>/all <id>/all
      # show resource state used
      # show resource state used handler <handler_id>
      # show resource state used owner_tag <onwer_local_tag>
      # show resource state used resource_id <resource_id>
      # show resource types
      # show router cache
      # show router cdrwriter
      # show router cdrwriter opened-files
      # show sensors
      # show stats
      # show system alarms
      # show system log-level
      # show system session-limit
      # show system status
      # show version

      def registrations_count
        registrations('count')
      end

      def registrations(*args)
        invoke_show(args)
      end

      def calls_filtered(only = [])
        calls('filtered', *only)
      end

      def calls_count
        calls('count')
      end

      def calls(*args)
        invoke_show(args)
      end

      def media_streams
        invoke_show
      end


      def system_status
        invoke_show
      end

      def stats
        invoke_show
      end

      def configuration
        invoke_show
      end

      def interfaces
        invoke_show
      end

      def version
        invoke_show
      end

      def resource_state(type_id, id = nil)
        invoke_show([type_id, id || :all])
      end 

      def invoke_show(args = [])
        invoke(caller_locations(1, 1)[0].label, 'show', args)
      end

    end
  end
end