# encoding: utf-8
module Troll
  class Process < MarvBot::Plugin
    match /:([^!]+)!.*PRIVMSG ##{MarvBot.channel} :!troll (.*?)?$/

    def execute
      trollador, trollado = matched[1,3]

      if trollado.eql? MarvBot.nickname
        response trollador, "não sou idiota o suficiente a ponto de praticar self-trolling"
      else
        response trollado, "iaeee troxa! hahaahaha!"
      end
    end

    private
      def response(trollador, message)
        "PRIVMSG ##{MarvBot.channel} :#{trollador}: #{message}"
      end
  end

  class Add < MarvBot::Plugin
    match /:([^!]+)!.*PRIVMSG ##{MarvBot.channel} :!add_troll (.*?)?$/

    def execute
      trollador, trollagem = matched[1,3]
      response trollador, "adicionado com sucesso! [#{trollagem}]"
    end

    private
      def response(trollador, message)
        "PRIVMSG ##{MarvBot.channel} :#{trollador}: #{message}"
      end
  end

  MarvBot::Service.register Process, Add
end
