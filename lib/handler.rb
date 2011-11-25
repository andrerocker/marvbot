module MarvBot
  module Handler
    include IRC
    include Router
    include Logger

    def post_init
      start MarvBot.nickname, MarvBot.channel
    end

    def receive_data(message)
      route(message).each do |service|
        response = service.execute
        irc response if response
      end
    end

    def unbind
      EventMachine::stop_event_loop
    end
  end
end
