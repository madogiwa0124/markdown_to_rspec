require_relative 'lib/markdown_to_rspec/version'

Gem::Specification.new do |spec|
  spec.name          = "markdown_to_rspec"
  spec.version       = MarkdownToRspec::VERSION
  spec.authors       = ["Madogiwa"]
  spec.email         = ["madogiwa0124@gmail.com"]

  spec.summary       = "This gem converts text in markdown format into text in RSpec format."
  spec.description   = "This gem converts text in markdown format into text in RSpec format."
  spec.homepage      = "https://github.com/Madogiwa0124/markdown_to_rspec"
  spec.license       = "MIT"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.required_ruby_version = ">= 2.5.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|\.github)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "rake", '~> 13.0'
end
