# encoding: utf-8
module MarvBot
  extend self

  rocker_accessor :server, "irc.freenode.net"
  rocker_accessor :port, 6667
  rocker_accessor :channel, "andrerocker-dev"
  rocker_accessor :nickname, "marvbot"

  def start(&block)
    EM.run do
      instance_exec(self, &block)
      log.info "conectando [server: #{server} port: #{port} channel: #{channel} nickname: #{nickname}]"
      EM.connect server, port, MarvBot::Handler
    end
  end

  def register(*services)
    Service.send(:register, *services)
  end
end
