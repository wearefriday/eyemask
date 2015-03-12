require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'
  require 'cucumber'
  require 'cucumber/rake/task'

  # Default directory to look in is `/specs`
  # Run with `rake spec`
  RSpec::Core::RakeTask.new(:specs) do |task|
    task.rspec_opts = ['--color']
  end

  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "--format progress"
  end

  rescue LoadError

  desc 'RSpec rake task not available'
  task :specs do
    abort 'RSpec rake task is not available. Be sure to install RSpec as a gem or plugin'
  end

  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end

end

task :test => [:build,:install,:specs, :features]


task :default => :test