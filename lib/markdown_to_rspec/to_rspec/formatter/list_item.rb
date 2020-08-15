# frozen_string_literal: true

module MarkdownToRspec
  module ToRspec
    module Formatter
      class ListItem
        def call(rdoc_list_item, parent)
          @rdoc_list_item = rdoc_list_item
          # We don't allow nesting of it, so we only get the first element.
          paragraph_text = find_paragraph.parts[0]
          list_item = ToRspec::Item::ListItem.new(text: paragraph_text, parent: parent)
          parent.children << list_item if parent
          list_item
        end

        private

        attr_reader :rdoc_list_item

        def find_paragraph
          check_paragraph = ->(obj) { obj.class.name == 'RDoc::Markup::Paragraph' }
          rdoc_list_item.parts.find(&check_paragraph)
        end
      end
    end
  end
end
