require 'fileutils'
require 'erb'
require_relative 'tools/solution_generator'

desc 'Generate a file'
task :solution, [:difficulty, :topic] do |_t, args|
  unless args[:difficulty] && args[:topic]
    puts 'Missing args'
    exit
  end
  unless %w[Easy Medium Hard].include?(args[:difficulty])
    puts "Invalid difficulty: #{args[:difficulty]}"
    exit
  end

  topic = args[:topic].gsub(/[.\s]/) { |match| match == ' ' ? '_' : '' }
  SolutionGenerator.perform!(args[:difficulty], topic)
end
