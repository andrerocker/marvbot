require "logger"

module MarvBot
  module Logger
    def log
      @logger ||= begin
        logger = ::Logger.new(STDOUT)
        logger.formatter = proc do |severity, datetime, progname, msg|
          "#{severity} #{datetime.strftime("%d/%m/%Y %H:%M:%S")} #{msg}\n"
        end
        logger
      end
    end
  end
end
