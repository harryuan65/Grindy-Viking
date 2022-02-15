require 'fileutils'
require 'erb'
require_relative 'tools/solution_generator'

desc 'Generate a file'
task :solution, [:url] do |_t, args|
  unless args[:url]
    puts 'Missing args'
    exit
  end

  SolutionGenerator.perform!(args[:url])
end

task :check, [:d_id] do |_t, args|
  /(?<dif>e|m|h)(?<no>\d+)/ =~ args[:d_id]
  dir_name = {
    'e' => 'Easy',
    'm' => 'Medium',
    'h' => 'Hard'
  }[dif]
  path = Dir.entries(dir_name).find { _1[/#{no}./] }
  spec = File.join(dir_name, path, 'solution_spec.rb')
  puts `bundle exec rspec #{spec}`
end
