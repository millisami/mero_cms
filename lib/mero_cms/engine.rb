module MeroCms
  class Engine < Rails::Engine
    isolate_namespace MeroCms
    
    cattr_accessor :current_user, :login_url, :logout_url, :unauthorized_url, :can_manage_mero_cms

    def self.current_user
      @@current_user || raise(MeroCms::Engine::ConfigurationNotFound.new("current_user"))
    end

    def self.login_url
      @@login_url || raise(MeroCms::Engine::ConfigurationNotFound.new("login_url"))
    end

    def self.logout_url
      @@logout_url || raise(MeroCms::Engine::ConfigurationNotFound.new("logout_url"))
    end

    def self.unauthorized_url
      @@unauthorized_url || raise(MeroCms::Engine::ConfigurationNotFound.new("unauthorized_url"))
    end

    def self.can_manage_mero_cms
      @@can_manage_mero_cms || raise(MeroCms::Engine::ConfigurationNotFound.new("can_manage_mero_cms"))
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