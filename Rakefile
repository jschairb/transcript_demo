require 'rspec/core/rake_task'

task :default => [:spec]

desc "Get a console"
task :console do
  exec "bundle exec irb -Ilib -r application.rb"
end

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/**/*_spec.rb"
end
