# encoding: utf-8
module MarvBot
  module Service
    extend self
    rocker_accessor :registered, []

    def register(service)
      @registered << service
    end
  end
end

Dir[File.expand_path("./lib/services/**")].each do |file|
  clazz = File.basename(file).gsub(/.rb$/, '').camelize
  autoload clazz, file
end
