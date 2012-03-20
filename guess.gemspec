# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guess/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Kane"]
  gem.email         = ["andrew@getformidable.com"]
  gem.description   = %q{*Statistically* determine a person's gender based on his / her name.}
  gem.summary       = %q{*Statistically* determine a person's gender based on his / her name.}
  gem.homepage      = "https://github.com/ankane/guess"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "guess"
  gem.require_paths = ["lib"]
  gem.version       = Guess::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
