# frozen_string_literal: true

module MarkdownToRspec
  module ToRspec
    module Item
      class List < Base
        def initialize(parent: nil, children: [])
          @parent = parent
          @children = children
          @depth = parent ? parent.depth + 1 : 0
        end

        attr_reader :depth, :parent
        attr_accessor :children

        def convert
          children.map(&:convert).join("\n")
        end
      end
    end
  end
end
