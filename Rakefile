require 'rspec/core/rake_task'

task :desktop do
    RSpec::Core::RakeTask.new(:spec) do |test|
        test.pattern = './spec/*.rb'
    end
    Rake::Task['spec'].execute
end

task :smoke do
    RSpec::Core::RakeTask.new(:spec) do |test|
        test.pattern = './spec/*.rb'
        test.rspec_opts = '--tag smoke'
    end
    Rake::Task['spec'].execute
end