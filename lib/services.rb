module MarvBot
  module Services
    extend self
    @registered = []

    def registered
      @registered
    end

    def register(service)
      @registered << service 
    end
  end
end
