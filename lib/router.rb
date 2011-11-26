module MarvBot
  module Router
    def route(message_bundle)
      routed = []
      (messages(message_bundle).each do |message|
        routed << (services.collect do |service|
          matched = service.match?(message)
          service.new(message, matched) if matched
        end).delete_if {|service| service.nil?}
      end).delete_if {|service| service.nil?}
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
