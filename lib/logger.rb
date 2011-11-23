require "logger"

module MarvBot
  module Logger
    def logger
      @logger ||= ::Logger.new(STDOUT)
    end
  end
end
