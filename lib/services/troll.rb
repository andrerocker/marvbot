# encoding: utf-8
module Troll
  class Process < MarvBot::Plugin
    match /:([^!]+)!.*PRIVMSG ##{MarvBot.channel} :!troll ([^!]+)$/

    def execute
      trollador = matched[1]
      trollado  = matched[2]

      if trollado.eql? MarvBot.nickname
        response trollador, "não sou idiota o suficiente para praticar o self-trolling"
      else
        response trollado, "iaeee troxa! hahaahaha!"
      end
    end

    private
      def response(trollador, message)
        "PRIVMSG ##{MarvBot.channel} :#{trollador}: #{message}"
      end
  end

  MarvBot::Service.register Process
end
