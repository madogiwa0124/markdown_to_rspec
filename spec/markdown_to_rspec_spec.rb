# frozen_string_literal: true

RSpec.describe MarkdownToRspec do
  it 'has a version number' do
    expect(MarkdownToRspec::VERSION).not_to be nil
  end

  describe '.to_rspec' do
    let(:markdown) { File.read('spec/samples/sample.md') }
    let(:rspec) do
      <<~RSPEC.chomp
        RSpec.describe 'Details.' do
          # A screen to check something
          # ref: https://example/com/ticket/1
          describe 'Initial Display.' do
            context 'When a record exists.' do
              it 'The title must be displayed.' do
              end
              it 'The text must be displayed.' do
              end
            end
            context 'When the record does not exist.' do
              it 'The title should not be displayed.' do
              end
              it 'The text should not be displayed.' do
              end
            end
            context 'Other cases.' do
              it '500 pages to be displayed.' do
              end
            end
          end
        end
        RSpec.describe 'Index.' do
          # A screen to check something
          describe 'Initial Display.' do
            it 'The items must be displayed.' do
            end
          end
        end
      RSPEC
    end

    it 'Return the results of the Markdown to Rspec conversion.' do
      expect(described_class.to_rspec(markdown)).to eq rspec
    end
  end
end
