# frozen_string_literal: true

module MarkdownToRspec
  module ToRspec
    module Item
      class Base
        def depth
          raise NotImplementedError
        end

        def children
          raise NotImplementedError
        end

        def parent
          raise NotImplementedError
        end

        def convert
          raise NotImplementedError
        end

        #
        # insert indentation with depth in mind.
        # For example, if depth is 2, indext("foo bar") #=> "    foo bar"
        #
        # @param [String] line The string of the line to insert the indent.
        # @param [Intger] indent_length The number of indented characters.
        # @param [String] indent_string Character to be used for indentation.
        #
        # @return [String] Indented string.
        # ex) depth: 2
        #
        def indent(line, indent_length = 2, indent_string = ' ')
          line.dup.prepend(indent_string * indent_length * depth)
        end
      end
    end
  end
end
