# frozen_string_literal: true

module MarkdownToRspec
  module ToRspec
    module Item
      class Paragraph < Base
        def initialize(text:, parent: nil, children: [])
          @text = text
          @parent = parent
          @children = children
          @depth = parent ? parent.depth + 1 : 0
        end

        attr_reader :text, :depth, :parent, :children

        def convert
          lines = text.split("\n").map { |line| template(line) }
          lines.map { |line| indent(line) }
               .join("\n")
        end

        private

        def template(text)
          "# #{text}"
        end
      end
    end
  end
end
