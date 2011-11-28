module MarvBot
  module IRC
    include MarvBot::Router
    include MarvBot::Logger

    def start(nickname, room)
      irc %( NICK #{nickname}
             USER #{nickname} 0 * #{nickname.capitalize}
             JOIN ##{room} )
    end

    def interact(message)
      route(message).each do |category|
        category.each do |service|
          response = service.execute
          if response.is_a? String
            service.log.debug response
            irc response
          end
        end
      end
    end

    def stop
      EM.stop_event_loop
    end

    def irc(command)
      send_data "#{command}\n"
    end
  end
end