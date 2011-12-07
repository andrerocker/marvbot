module MarvBot
  module Executor
    def process(service)
      Thread.new do
        response = service.execute
        if response.is_a? String
          service.log.info response
          irc response
        end
      end
    end
  end
end
