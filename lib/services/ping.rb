# encoding: utf-8
class Ping < MarvBot::Plugin
  match /PING :(.*)$/

  def execute
    "PONG #{matched[1]}"
  end
end
