#!/usr/bin/env ruby

require "thor"

class Command < Thor
  desc "spec <id>", "Run spec for question"
  def spec(id)
    path = nil
    dir_names = %w[Easy Medium Hard]
    dir_names.each do |dir_name|
      target = Dir.entries(dir_name).find { _1[/\A#{id}\./] }
      next unless target

      path = File.join(dir_name, target)
      break
    end

    if path.nil?
      puts "Not found"
      exit
    end

    spec = File.join(path, "solution_spec.rb")
    exec "bundle exec rspec #{spec}"
  end
end

Command.start
