# encoding: utf-8
module MarvBot
  module Service
    extend self
    rocker_accessor :registered, []

    def register(*services)
      services.each do |service|
        if service.class.eql? Class
          log.debug "registrando service: #{service} regex: #{service.regex}"
          @registered << service
        end
      end
    end
  end
end

Dir[File.expand_path("./lib/services/**")].each do |file|
  clazz = File.basename(file).gsub(/.rb$/, '').camelize
  autoload clazz, file
end
