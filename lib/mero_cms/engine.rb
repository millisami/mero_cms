module MeroCms
  class Engine < Rails::Engine
    isolate_namespace MeroCms
    
    cattr_accessor :current_user

    def self.current_user 
      @@current_user || raise(MeroCms::Engine::ConfigurationNotFound.new("current_user"))
    end

  end
  
end

module MeroCms
  class Engine  
    class ConfigurationNotFound < StandardError 

      attr_accessor :message

      def initialize(option)
        @message = "MeroCms configuration option #{option} not found. Please set this in config/initializers/mero_cms.rb."
      end
    end
  end
end