require 'rails/generators/migration'
require 'rails/generators/active_record'

class MeroCmsGenerator < Rails::Generators::Base
  
  desc "Generates an initializer for Mero Cms"
  source_root File.expand_path("../templates", __FILE__)

  def generate_initializer
    say_status("Generating", "Mero Cms initializer", :green)
    copy_file "initializer.rb", "config/initializers/mero_cms.rb"
  end
  
  def add_mero_cms_mounted_route
    say_status("Injecting", "mounting MeroCms engine in routes", :green)
    mero_cms_route  = "mount MeroCms::Engine => '/mero_cms'"
    route mero_cms_route
  end
end