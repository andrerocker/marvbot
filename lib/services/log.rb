class Log < MarvBot::Plugin
  accept :all

  def execute
    log.info message
    nil
  end
end
