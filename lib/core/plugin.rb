module MarvBot
  # Modulo bizarro que implementei para criar um metodo de log personalizado
  # para cada "Plugin", assim o output fica mais direcionado em qual modulo
  # realizou aquele processamento
  module Poison
    def poison
      eval <<-HACK
        def log.info(message)
          super "[#{self.class.name}] \#{message}"
        end
        
        def log.debug(message)
          super "[#{self.class.name}] \#{message}"
        end
      HACK
    end
  end
  
  class Plugin
    attr_accessor :message
    attr_accessor :matched
    
    include Logger
    include Poison

    def initialize(message, matched)
      @message = message
      @matched = matched
      poison
    end

    class << self
      attr_accessor :regex

      def match(regex)
        @regex = regex
      end

      def match?(message)
        return [] if regex.eql? :all
        result = message.scan(regex)
        return false if result.empty?
        result
      end
    end
  end
end
