require "fileutils"
require "erb"
require_relative "tools/solution_generator"

desc "Generate a file"
task :solution, [:url] do |_t, args|
  unless args[:url]
    puts "Missing args"
    exit
  end

  SolutionGenerator.perform!(args[:url])
end

task :check, [:id] do |_t, args|
  # /(?<dif>e|m|h)(?<no>\d+)/ =~ args[:d_id]
  path = nil
  dir_names = %w[Easy Medium Hard]
  dir_names.each do |dir_name|
    target = Dir.entries(dir_name).find { _1[/\A#{args[:id]}\./] }
    next unless target

    path = File.join(dir_name, target)
    break
  end
  if path.nil?
    puts "Not found"
    exit
  end

  spec = File.join(path, "solution_spec.rb")
  puts `bundle exec rspec #{spec} --color`
end
