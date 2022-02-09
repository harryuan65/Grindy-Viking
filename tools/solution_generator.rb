# frozen_string_literal: true

require 'json'
require_relative 'file_generator'
require_relative 'folder_generator'

# Generates a solution
class SolutionGenerator
  def self.perform!(question_url)
    topic = question_url[%r{https://leetcode.com/problems/(?<topic>[a-z0-9-]+)}, :topic]
    raise 'Unprocessable url' unless topic

    summary = JSON.parse(File.read('tools/question_summary.json'))[topic]
    id, difficulty = summary.values_at('id', 'difficulty')
    puts [id, difficulty, topic].join(' | ')
    root = File.join(difficulty, "#{id}.#{topic}")
    # https://leetcode.com/problems/remove-nth-node-from-end-of-list/
    FolderGenerator.perform!(root)
    FileGenerator.perform!(File.join(root, 'solution.rb'))
    FileGenerator.perform!(File.join(root, "#{topic}.md")) do |f|
      @url = question_url
      template = File.read('tools/templates/solution.md.erb')
      result = ERB.new(template).result(binding)
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
