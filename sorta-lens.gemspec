# frozen_string_literal: true

require_relative "lib/version"

Gem::Specification.new do |spec|
  spec.name          = "sorta-lens"
  spec.version       = Sorta::Lens::VERSION
  spec.authors       = ["Ivan Chinenov"]
  spec.email         = ["ichinenov@gmail.com"]

  spec.summary       = "Simple lensing for your data extraction needs"
  spec.homepage      = "https://github.com/sorta-rb/sorta-lens"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sorta-rb/sorta-lens"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ["lib"]
end
