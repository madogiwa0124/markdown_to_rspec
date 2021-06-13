# frozen_string_literal: true

module MarkdownToRspec
  module ToRspec
    module Formatter
      class List
        def call(rdoc_list, parent)
          list = ToRspec::Item::List.new(parent: parent)
          rdoc_list.items.each { |item| format(item, list) }
          parent.children << list if parent
          list
        end

        private

        def format(item, parent)
          { 'RDoc::Markup::ListItem' => Formatter::ListItem.new }[item.class.name]&.call(item, parent)
        end
      end
    end
  end
end
