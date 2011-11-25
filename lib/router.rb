module MarvBot
  module Router
    def route(message_bundle)
      routed = []
      messages(message_bundle).each do |message|
        routed = (services.collect do |service|
          service.new message if service.accept? message
        end).delete_if {|service| service.nil?}
      end
      routed
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
