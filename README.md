# MarkdownToRspec

![ci](https://github.com/Madogiwa0124/markdown_to_rspec/workflows/ci/badge.svg)

converts text in markdown format into text in RSpec format.

This gem uses `RDoc::Markdown` to parse the text in markdown format, generates `RDoc::Markup::Document`, and then generates an text in RSpec format from it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'markdown_to_rspec'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install markdown_to_rspec

## Usage

``` ruby
# CLI
$ markdown_to_rspec `file_path`
#=> return A string in RSpec format

# in ruby code
markdown = "A string in markdown format"
MarkdownToRspec.to_rspec(`markdown text`)
#=> return A string in RSpec format
```

### Sample

The following text is in markdown format

``` markdown
# Details.
A screen to check something
ref: https://example/com/ticket/1

## Initial Display.

### When a record exists.
* The title must be displayed.
* The text must be displayed.

### When the record does not exist.
* The title should not be displayed.
* The text should not be displayed.

### Other cases.
* 500 pages to be displayed.
```

You can convert it to an text in RSpec format.

``` ruby
RSpec.describe 'Details.' do
  # A screen to check something
  # ref: https://example/com/tickets/1
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
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Madogiwa0124/markdown_to_rspec. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Madogiwa0124/markdown_to_rspec/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MarkdownToRspec project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Madogiwa0124/markdown_to_rspec/blob/master/CODE_OF_CONDUCT.md).
