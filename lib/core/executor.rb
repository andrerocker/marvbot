module MarvBot
  module Executor
    def process(service)
      EM.defer service.deferred, result(service)
    end

    def result(service)
      Proc.new do |response|
        if response.is_a? String
          service.log.info response
          irc response
        end
      end
    end
  end
end
