class Hello < MarvBot::Plugin
  match /:([^!]+)!.*JOIN #(.*)$/
  
  def execute
    "PRIVMSG ##{matched[1]} :Iaeee Favela!"
  end
end