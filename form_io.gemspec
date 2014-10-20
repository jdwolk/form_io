# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'form_io/version'

Gem::Specification.new do |spec|
  spec.name          = 'form_io'
  spec.version       = FormIO::VERSION
  spec.authors       = ['Jordaniel Wolk']
  spec.email         = ['jd@gophilosophie.com']
  spec.summary       = %q{Principled form objects with less responsibilities}
  spec.description   = %q{Principled form objects with less responsibilities}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  #spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7.4'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'pry-byebug', '~> 2.0.0'
  spec.add_development_dependency 'guard', '~> 2.6.1'
  spec.add_development_dependency 'guard-rspec', '~> 4.3.1'
end
