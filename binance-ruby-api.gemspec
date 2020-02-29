# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'binance/version'

Gem::Specification.new do |spec|
  spec.name          = 'binance-ruby-api'
  spec.version       = Binance::VERSION
  spec.authors       = ['Liang Shi']
  spec.email         = ['liang.shi@protonmail.com']

  spec.summary       = 'A library for working with binance public API'
  spec.description   = 'Hope to support all binance API'
  spec.homepage      = 'https://github.com/2pd/binance-ruby-api'
  spec.license       = 'MIT'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/2pd/binance-ruby-api'
  spec.metadata['changelog_uri'] = 'https://github.com/2pd/binance-ruby-api/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
