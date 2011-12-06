require "lib/core/logger"

class BasicObject
  include ::MarvBot::Logger

  def rocker_accessor(sym, value)
    attr_accessor sym
    instance_variable_set("@#{sym}", value)
  end
end
