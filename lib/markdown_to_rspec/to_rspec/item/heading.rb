# frozen_string_literal: true

module MarkdownToRspec
  module ToRspec
    module Item
      class Heading < Base
        def initialize(level:, text:, parent: nil, children: [])
          @level = level
          @text = text
          @parent = parent
          @children = children
          # If there is a parent, nest it and add it to the parent's child elements.
          @depth = parent ? parent.depth + 1 : 0
        end

        attr_reader :level, :text, :depth, :parent
        attr_accessor :children

        def convert
          template(level_to_syntax, text)
            .split("\n")
            .map { |line| indent(line) }
            .insert(1, convert_children) # Insert the result of a child element between do...end.
            .join("\n")
        end

        private

        def convert_children
          children.map(&:convert).join("\n")
        end

        def template(syntax, text)
          <<~TEXT
            #{syntax} '#{text.gsub(/"|'/, '')}' do
            end
          TEXT
        end

        def level_to_syntax
          case level
          when 1 then 'RSpec.describe'
          when 2 then 'describe'
          else 'context'
          end
        end
      end
    end
  end
end
