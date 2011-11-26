class Ping < MarvBot::Plugin
  match /PING :(.*)$/

  def execute
    command = "PONG #{matched[0][0].chomp}"
    log.info command
    command
  end
end
