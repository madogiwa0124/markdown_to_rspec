# frozen_string_literal: true

require 'rake'
require 'pathname'
require 'markdown_to_rspec'

namespace :markdown_to_rspec do
  desc 'converts file in markdown format into executable RSpec text.'
  task :to_rspec_from_file, [:file_path] do |_task, args|
    markdown_file_path = Pathname.new(args[:file_path].to_s)
    if markdown_file_path.extname == '.md'
      markdown_text = File.read(markdown_file_path)
      puts MarkdownToRspec.to_rspec(markdown_text)
    else
      raise(MarkdownToRspec::InValidFileFormatError, 'Specify the file as a `.md` format.')
    end
  end

  desc 'converts text in markdown format into executable RSpec text.'
  task :to_rspec_from_text, [:text] do |_task, args|
    # unescaped new line string.
    markdown_text = args[:text].to_s.gsub('\\n', "\n")
    puts MarkdownToRspec.to_rspec(markdown_text)
  end

  desc 'Show gem version.'
  task :version do
    puts "markdown_to_rspec: #{MarkdownToRspec::VERSION}"
  end
end
