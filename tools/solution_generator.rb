# frozen_string_literal: true

require_relative 'file_generator'
require_relative 'folder_generator'

# Generates a solution
class SolutionGenerator
  def self.perform!(difficulty, topic)
    root = File.join('leetcode', difficulty, topic)

    FolderGenerator.perform!(root)
    FileGenerator.perform!(File.join(root, 'solution.rb'))
    FolderGenerator.perform!(File.join(root, 'spec'))
    FileGenerator.perform!(File.join(root, 'spec', 'solution_spec.rb')) do |f|
      @method = '#solution'
      template = File.read('tools/templates/solution_spec.rb.erb')
      result = ERB.new(template).result(binding)
      f.write(result)
    end
  end
end
