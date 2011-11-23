require "logger"

module BarrierBot
  module Logger
    def logger
      @logger ||= ::Logger.new(STDOUT)
    end
  end
end