$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'publify_textfilter_code/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'publify_textfilter_code'
  s.version     = PublifyTextfilterCode::VERSION
  s.authors     = ['Matijs van Zuijlen']
  s.email       = ['matijs@matijs.net']
  s.homepage    = 'https://publify.co'
  s.summary     = 'Code text filter for the Publify blogging system.'
  s.description = 'Code text filter sidebar for the Publify blogging system.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.2.7'
  s.add_dependency 'publify_core', '~> 9.0.0.pre1'
  s.add_dependency 'coderay', '~> 1.1.0'
  s.add_dependency 'htmlentities', '~> 4.3'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '~> 3.5.2'
  s.add_development_dependency 'rubocop', '~> 0.45.0'
end
