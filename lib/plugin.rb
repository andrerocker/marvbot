module MarvBot
  class Plugin
    include Logger
    attr_accessor :message
    attr_accessor :result

    def initialize(message, result)
      @message = message
      @result  = result
    end

    def export_environment
      return if self.class.regex.eql? :all 
      message =~ self.class.regex 
    end

    class << self
      attr_accessor :regex

      def accept(regex)
        @regex = regex
      end

      def accept?(message)
        return []  if regex.eql? :all
        message.scan regex
      end
    end
  end
end
