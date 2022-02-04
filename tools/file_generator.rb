# frozen_string_literal: true

# Generate a file ifne with custom body
class FileGenerator
  def self.perform!(path, &block)
    if File.exist?(path)
      puts "Already exists: #{path}"
    else
      puts "Creating file #{path}"
      block ||= ->(f) {} unless block_given?
      File.open(path, 'w', &block)
    end
  end
end
