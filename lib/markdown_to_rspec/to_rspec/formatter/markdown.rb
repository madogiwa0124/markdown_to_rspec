# frozen_string_literal: true

require 'rdoc'
require 'rdoc/markdown'
require 'markdown_to_rspec/to_rspec/item/all'
require_relative './all'

module MarkdownToRspec
  module ToRspec
    module Formatter
      class Markdown
        def initialize(markdown:)
          @markdown = markdown
          @parsed_markdown = RDoc::Markdown.parse(markdown)
          @items = []
        end

        attr_reader :markdown, :parsed_markdown, :items

        def call
          parsed_markdown.parts.each do |part|
            item = format(part, find_parent(part))
            @items << item
          end
          # Each item renders a child element, so only top-level items are converted.
          items.select { |item| item.parent.nil? }.map(&:convert).join("\n")
        end

        private

        def find_parent(rdoc_item)
          return headings.last unless rdoc_item.respond_to?(:level)

          # Get a lower level Header than rdoc_item most recent one (lower is higher)
          headings.reverse.find { |heading| heading.level < rdoc_item.level }
        end

        def headings
          items.select { |item| item.instance_of? Item::Heading }
        end

        def format(part, parent)
          formatters = {
            'RDoc::Markup::Heading' => Formatter::Heading.new,
            'RDoc::Markup::List' => Formatter::List.new,
            'RDoc::Markup::Paragraph' => Formatter::Paragraph.new
          }
          formatters[part.class.name]&.call(part, parent)
        end
      end
    end
  end
end
