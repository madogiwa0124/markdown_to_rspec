# frozen_string_literal: true

module MarkdownToRspec
  module ToRspec
    module Formatter
      class Heading
        def call(rdoc_heading, parent)
          rspec_heading = build_rspec_rspec_heading(rdoc_heading, parent)
          parent.children << rspec_heading if parent
          rspec_heading
        end

        private

        def build_rspec_rspec_heading(rdoc_header, parent)
          ToRspec::Item::Heading.new(
            text: rdoc_header.text,
            level: rdoc_header.level,
            parent: parent
          )
        end
      end
    end
  end
end
