class Hello < MarvBot::Plugin
  match /:#{MarvBot.nickname}!.*JOIN #(.*)$/
  
  def execute
    "PRIVMSG ##{matched[0]} :Iaeee Galera"
  end
end