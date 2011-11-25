module MarvBot
  module IRC
    def start(nickname, room)
      irc %( NICK #{nickname}
             USER #{nickname} 0 * #{nickname.capitalize}
             JOIN ##{room} )
    end

    def irc(command)
      log.debug command
      send_data "#{command}\n"
    end
  end
end
