require 'bundler/gem_tasksr'
require 'rspec/core/rake_task'

# Run with `rake spec`
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'nested']
end

task default: :spec
