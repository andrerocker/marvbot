module MarvBot
  include MarvBot::Logger
  extend self
  
  rocker_accessor :server, "irc.freenode.net"
  rocker_accessor :port, 6667
  rocker_accessor :channel, "andrerocker-dev"
  rocker_accessor :nickname, "marvbot"

  def start(&block)
    EM.run do
      instance_exec(self, &block)
      log.info "Init [server: #{server} port: #{port} channel: #{channel} nickname: #{nickname}]"
      EM.connect server, port, MarvBot::Handler
    end
  end

  def register(service)
    Service.register(service)
  end
end