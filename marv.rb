$:.unshift File.expand_path "."

require "eventmachine"
require "lib/logger"
require "lib/router"

module MarvBot
  include Logger
  include Router

  def post_init
    start("marv", "andrerocker-dev")
  end

  def receive_data(message)
    route message
  end

  def unbind
    EventMachine::stop_event_loop
  end
  
  private
    def start(nickname, room)
      say %(NICK #{nickname}
           USER #{nickname} 0 * #{nickname.capitalize}
           JOIN ##{room})
    end
  
    def say(command)
      logger.info("raw: #{command}")
      send_data "#{command}\n"
    end
end

EM.run do
  EventMachine::connect "irc.freenode.net", 6667, MarvBot
end