require 'spec_helper'

describe "required configuration options must be set" do 
  
  required_options = [:current_user, :login_url, :logout_url, :unauthorized_url, :can_manage_mero_cms]
  
  required_options.each do |option|
    it "requires #{option} is set" do 
      MeroCms::Engine.send("#{option}=", nil) 
      option_call = lambda { MeroCms::Engine.send(option) } 
      
      option_call.should raise_error(MeroCms::Engine::ConfigurationNotFound, 
            "MeroCms configuration option #{option} not found. Please set this in config/initializers/mero_cms.rb.")
      
      MeroCms::Engine.send("#{option}=", "not nil")
      option_call.should_not raise_error 
    end
  end
  
  it "requires #{MeroCms::Engine.current_user} to define #{MeroCms::Engine.can_manage_mero_cms} instance method" do
    MeroCms::Engine.send("can_manage_mero_cms=", "bogus_method")
    
    user = User.find_or_create_by_login("mero_cms_user")
    user.should_not respond_to(MeroCms::Engine.can_manage_mero_cms)
    
    MeroCms::Engine.send("can_manage_mero_cms=", "can_manage_mero_cms")
    user.should respond_to(MeroCms::Engine.can_manage_mero_cms)
  end
end