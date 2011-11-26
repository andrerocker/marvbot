class Log < MarvBot::Plugin
  match :all
  
  def execute
    log.info message
    nil
  end
end
