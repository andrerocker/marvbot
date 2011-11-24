class Module
  def rocker_accessor(sym, value)
    attr_accessor sym 
    instance_variable_set("@#{sym}", value)
  end
end
