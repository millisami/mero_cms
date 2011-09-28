$:.push File.expand_path("../lib", __FILE__)

require "mero_cms/version"

Gem::Specification.new do |s|
  s.name        = "mero_cms"
  s.summary     = "Insert MeroCms summary."
  s.description = "Insert MeroCms description."
  s.version     = MeroCms::VERSION
  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rspec-rails", "~> 2.6"
  s.add_development_dependency "capybara", "~> 1.1"
  s.add_development_dependency "launchy", "0.3.7"
  s.add_development_dependency "database_cleaner", "~> 0.6.7"
  s.add_development_dependency "valid_attribute", "~> 0.0"
  s.add_development_dependency "mocha", "~> 0.9.12"
  s.add_development_dependency "generator_spec", "~> 0.8.3"
end
