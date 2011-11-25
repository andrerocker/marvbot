require "logger"

module MarvBot
  module Logger
    def log
      @logger ||= ::Logger.new(STDOUT)
    end
  end
end
