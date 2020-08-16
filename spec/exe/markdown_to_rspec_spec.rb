# frozen_string_literal: true

RSpec.describe 'MarkdownToRspec CLI' do
  describe 'varsion' do
    let(:version_text) { "markdown_to_rspec: #{MarkdownToRspec::VERSION}" }

    it 'Return gem version' do
      expect(`bundle exec ruby exe/markdown_to_rspec -v`.chomp).to eq version_text
      expect(`bundle exec ruby exe/markdown_to_rspec --version`.chomp).to eq version_text
    end
  end

  describe 'to_rspec' do
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

    describe 'markdown_to_rspec -f' do
      let(:markdown_path) { 'spec/samples/sample.md' }

      it 'Return the results of the Markdown to Rspec conversion.' do
        expect(`bundle exec ruby exe/markdown_to_rspec -f #{markdown_path}`.chomp).to eq rspec
        expect(`bundle exec ruby exe/markdown_to_rspec --file #{markdown_path}`.chomp).to eq rspec
      end
    end

    describe 'markdown_to_rspec -t' do
      let(:markdown_text) { File.read('spec/samples/sample.md') }

      it 'Return the results of the Markdown to Rspec conversion.' do
        expect(`bundle exec ruby exe/markdown_to_rspec -t "#{markdown_text}"`.chomp).to eq rspec
        expect(`bundle exec ruby exe/markdown_to_rspec --text "#{markdown_text}"`.chomp).to eq rspec
      end
    end
  end
end
