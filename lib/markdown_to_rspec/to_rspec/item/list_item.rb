# frozen_string_literal: true

module MarkdownToRspec
  module ToRspec
    module Item
      class ListItem < Base
        def initialize(text:, parent: nil, children: [])
          @text = text
          @parent = parent
          @children = children
          # The parent element(List), does not have a drawing element, so it inherits the parent's depth.
          @depth = parent ? parent.depth : 0
        end

        attr_reader :text, :depth, :parent, :children

        def convert
          template(text).split("\n").map { |line| indent(line) }.join("\n")
        end

        private

        def template(text)
          <<~TEXT
            it '#{text.gsub("\n", ' ').gsub(/"|'/, '')}' do
            end
          TEXT
        end
      end
    end
  end
end
