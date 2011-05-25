source "http://rubygems.org"

gem 'rails', '3.1.0.rc1'
gem "rake", "0.8.7"

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'
gem 'css3buttons'

group :development, :test do
  gem 'sqlite3'
end

group :test do
  if RUBY_VERSION < '1.9'
    gem "ruby-debug", "~> 0.10.3"
  else
    gem "ruby-debug19"
  end
end
gemspec
