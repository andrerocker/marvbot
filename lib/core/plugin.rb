# encoding: utf-8
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

    include Poison

    def initialize(message, matched)
      @message = message
      @matched = matched
      poison
    end

    def deferred
      Proc.new do
        self.execute
      end
    end

    class << self
      attr_accessor :regex

      def match(regex)
        @regex = regex
      end

      def match?(message)
        return [] if regex.eql? :all
        result = message.match(regex)
        return false if result.nil?
        result
      end
    end
  end
end
