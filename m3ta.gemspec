# frozen_string_literal: true

require_relative 'lib/m3ta/version'

Gem::Specification.new do |spec|
  spec.name        = 'm3ta'
  spec.version     = M3ta::VERSION
  spec.authors     = ['RobL']
  spec.email       = ['contact@robl.me']
  spec.homepage    = 'https://github.com/braindeaf/m3ta'
  spec.summary     = 'Define meta tags in your Rails app'
  spec.description = 'Define meta tags in your Rails app in defaults, i18n locales, controllers and views.'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'hashie', '5.0.0'
  spec.add_dependency 'rails', '~> 7.0', '>= 7.0.4.1'

  spec.add_development_dependency 'factory_bot', '~> 6.2.1'
  spec.add_development_dependency 'faker', '~> 3.1.1'
  spec.add_development_dependency 'rspec-rails', '~> 6.0.1'
  spec.add_development_dependency 'rubocop-rails', '~> 2.17.4'
  spec.add_development_dependency 'simplecov', '~> 0.22.0'
end
