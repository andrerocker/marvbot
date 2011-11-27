module MarvBot
  class Plugin
    include Logger
    attr_accessor :message
    attr_accessor :matched

    def initialize(message, matched)
      @message = message
      @matched = matched
    end

    class << self
      attr_accessor :regex

      def match(regex)
        @regex = regex
      end

      def match?(message)
        return :all if regex.eql? :all
        result = message.scan(regex)
        return false if result.empty?
        result
      end
    end
  end
end
