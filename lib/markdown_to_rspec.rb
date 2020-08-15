# frozen_string_literal: true

require 'markdown_to_rspec/version'
require 'markdown_to_rspec/to_rspec/formatter/markdown'

module MarkdownToRspec
  class InValidFileFormatError < StandardError; end

  def self.to_rspec(markdown)
    ToRspec::Formatter::Markdown.new(markdown: markdown).call
  end
end
