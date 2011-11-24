module MarvBot
  module Router
    def route(message_bundle)
      messages(message_bundle).select do |message|
        logger.info message
        services.select do |service|
          service.respond message
        end
      end
    end

    private
      def messages(message_bundle)
        message_bundle.split("\n") 
      end

      def services
        Service.registered
      end
  end
end
