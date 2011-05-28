require 'spec_helper'

describe "required configuration options must be set" do 
  required_options = [:current_user] 
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
end