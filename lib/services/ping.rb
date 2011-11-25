class Ping < MarvBot::Plugin
  accept /PING :(.*)$/

  def execute
    message =~ /PING :(.*)$/
    log.info "processando requisicao de PING"
    "PONG #{$1}"
  end
end
