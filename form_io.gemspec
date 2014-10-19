# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'form_io/version'

Gem::Specification.new do |spec|
  spec.name          = 'form_io'
  spec.version       = FormIo::VERSION
  spec.authors       = ['Jordaniel Wolk']
  spec.email         = ['jd@gophilosophie.com']
  spec.summary       = %q{Framework for simpler form objects}
  spec.description   = %q{Framework for simpler form objects}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
