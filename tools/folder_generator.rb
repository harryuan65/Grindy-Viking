# frozen_string_literal: true

require 'fileutils'

# Mkdir ifne
class FolderGenerator
  def self.perform!(dir_path)
    if File.directory?(dir_path)
      puts 'Already exists: '
    else
      puts "Creating dir #{dir_path}"
      FileUtils.mkdir_p(dir_path)
    end
  end
end
