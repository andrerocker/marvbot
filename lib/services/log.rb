# encoding: utf-8
class Log < MarvBot::Plugin
  match :all

  def execute
    log.info message
  end
end
