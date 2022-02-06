# frozen_string_literal: true

require_relative 'file_generator'
require_relative 'folder_generator'

# Generates a solution
class SolutionGenerator
  def self.perform!(difficulty, topic)
    root = File.join(difficulty, topic)

    FolderGenerator.perform!(root)
    FileGenerator.perform!(File.join(root, 'solution.rb'))
    FileGenerator.perform!(File.join(root, "#{topic}.md")) do |f|
      template = File.read('tools/templates/solution.md.erb')
      result = ERB.new(template).result
      f.write(result)
    end
    FolderGenerator.perform!(File.join(root, 'images'))
    FileGenerator.perform!(File.join(root, 'solution_spec.rb')) do |f|
      @method = '#solution'
      template = File.read('tools/templates/solution_spec.rb.erb')
      result = ERB.new(template).result(binding)
      f.write(result)
    end
  end
end
