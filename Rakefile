# frozen_string_literal: true

require "bundler/setup"
require "bundler/gem_tasks" # provides rake build, rake install, rake release
require "rake/testtask"

APP_RAKEFILE = File.expand_path("test/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake" if File.exist?(APP_RAKEFILE)

Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "lib"
  t.pattern = "test/**/*_test.rb"
  t.verbose = false
end

task default: :test
