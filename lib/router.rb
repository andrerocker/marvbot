module MarvBot
  module Router
    def route(message_bundle)
      messages(message_bundle).each do |message|
        logger.info message
        services.select do |service|
          service if service.respond message
        end
      end
    end

    private
      def messages(message_bundle)
        message_bundle.split("\n") 
      end

      def services
        Services.registered
      end
  end
end
