# desc "Explaining what the task does"
# task :mero_cms do
#   # Task goes here
# end

require 'rspec/core/rake_task'
require 'rake/clean'
CLEAN.include('*.tmp')
CLOBBER.include('*.tmp', 'build/*')

desc "Example of task with invoke"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

desc "Generate code coverage"
RSpec::Core::RakeTask.new(:coverage) do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec']
end

desc "Default: run specs"
task :default => :spec