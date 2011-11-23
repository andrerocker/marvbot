module BarrierBot
  module Router
    def route(message_bundle)
      message_bundle.split("\n").each |message|
        logger.info("processing message: #{message}")
        services.select do |service|
          service.respond message
        end
      end
    end
    
    def services
      Services.registered
    end
  end
end