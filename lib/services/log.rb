class Log < MarvBot::Plugin
  match :all

  def execute
    log.info message
  end
end
