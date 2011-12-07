# encoding: utf-8
class String
  def camelize
    self.split(/[^a-z0-9]/i).map{|w| w.capitalize}.join
  end
end

class BasicObject
  def rocker_accessor(sym, value)
    attr_accessor sym
    instance_variable_set("@#{sym}", value)
  end

  def log
    @logger ||= begin
      logger = ::Logger.new(::STDOUT)
      logger.formatter = proc do |severity, datetime, progname, msg|
        "#{severity} #{datetime.strftime("%d/%m/%Y %H:%M:%S")} #{msg}\n"
      end
      logger
    end
  end
end
