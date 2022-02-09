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
