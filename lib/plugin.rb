module MarvBot
  class Plugin
    include Logger
    attr_accessor :message
    
    def initialize(message)
      @message = message
    end
    
    class << self
      attr_accessor :regex
    
      def accept(regex)
        @regex = regex
      end
    
      def accept?(message)
        return true if regex.eql? :all
        message.scan(regex).size > 0
      end
    end
  end
end
