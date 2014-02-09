# -*- encoding: utf-8 -*-
require File.expand_path('../lib/siqidemy_plugin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kevin"]
  gem.email         = ["siqishuyuan@gmail.com"]
  gem.description   = %q{Toolkit for creating a siqidemy plugin}
  gem.summary       = %q{Originated by Robin Ward, revised by Kevin Hua}
  gem.homepage      = "https://github.com/sqsy/siqidemy_plugin"

  # when this is extracted comment it back in, prd has no .git 
  # gem.files         = `git ls-files`.split($\)
  gem.files         = Dir['README*','LICENSE','lib/**/*.rb']

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "siqidemy_plugin"
  gem.require_paths = ["lib"]
  gem.version       = SiqidemyPlugin::VERSION
end
