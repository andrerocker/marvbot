module MarvBot
  module Handler
    include IRC

    def post_init
      start MarvBot.nickname, MarvBot.channel
    end

    def receive_data(message)
      interact message
    end

    def unbind
      stop
    end
  end
end
