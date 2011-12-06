class Hello < MarvBot::Plugin
  match /:#{MarvBot.nickname}!.*JOIN #(.*)$/

  def execute
    "PRIVMSG ##{matched[1]} :Iaeee Galera"
  end
end
