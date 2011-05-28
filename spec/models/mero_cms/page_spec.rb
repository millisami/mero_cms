require 'spec_helper'

describe MeroCms::Page do
  
  it { should have_valid(:title).when("About Us", "FAQ's") }
  it { should_not have_valid(:title).when("123 $@^#\{\}", "") }
  
  it { should_not have_valid(:content).when("") }
  
end
