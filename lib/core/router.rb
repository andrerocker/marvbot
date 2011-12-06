module MarvBot
  module Router
    def route(message_bundle)
      routed = []
      messages(message_bundle).each do |message|
        routed << (services.collect do |service|
          matched = service.match?(message)
          service.new(message, clean(matched.to_a)) if matched
        end).compact
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

      def clean(matched)
        matched.collect &:chomp if matched
      end
  end
end
