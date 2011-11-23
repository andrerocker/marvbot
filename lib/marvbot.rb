module MarvBot
  include Logger
  include Router

  def post_init
    start "marvbot", "andrerocker-dev"
  end

  def receive_data(message)
    route message
  end

  def unbind
    EventMachine::stop_event_loop
  end

  private
    def start(nickname, room)
      say %( NICK #{nickname}
             USER #{nickname} 0 * #{nickname.capitalize}
             JOIN ##{room} )
    end

    def say(command)
      logger.info("raw: #{command}")
      send_data "#{command}\n"
    end
end


