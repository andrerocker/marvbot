class Ping < MarvBot::Plugin
  match /PING :(.*)$/

  def execute
    "PONG #{matched[0][0].chomp}"
  end
end
