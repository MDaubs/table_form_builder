require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the action_context plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the action_context plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActionContext'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "table_form_builder"
  gem.summary = "Table-based form builder for Rails 3"
  gem.email = "mdaubert@gmail.com"
  gem.homepage = "http://github.com/MDaubs/table_form_builder"
  gem.authors = ["Matthew Daubert"]
end
Jeweler::GemcutterTasks.new
