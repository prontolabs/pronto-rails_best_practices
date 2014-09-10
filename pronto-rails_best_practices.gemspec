# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'pronto/rails_best_practices/version'

Gem::Specification.new do |s|
  s.name = 'pronto-rails_best_practices'
  s.version = Pronto::RailsBestPracticesVersion::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = 'Mindaugas Mozūras'
  s.email = 'mindaugas.mozuras@gmail.com'
  s.homepage = 'http://github.org/mmozuras/pronto-rails_best_practices'
  s.summary = 'Pronto runner for Rails Best Practices, code metric tool for Rails projects'

  s.required_rubygems_version = '>= 1.3.6'
  s.license = 'MIT'

  s.files = Dir.glob('{lib}/**/*') + %w(LICENSE README.md)
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'pronto', '~> 0.2.0'
  s.add_dependency 'rails_best_practices', '~> 1.14.0'
  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-its', '~> 1.0'
end
