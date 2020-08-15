# frozen_string_literal: true

module MarkdownToRspec
  module ToRspec
    module Formatter
      class Paragraph
        def call(rdoc_paragraph, parent)
          rspec_paragraph = build_rspec_rspec_paragraph(rdoc_paragraph, parent)
          parent.children << rspec_paragraph if parent
          rspec_paragraph
        end

        private

        def build_rspec_rspec_paragraph(rdoc_paragraph, parent)
          ToRspec::Item::Paragraph.new(
            text: rdoc_paragraph.text,
            parent: parent
          )
        end
      end
    end
  end
end
