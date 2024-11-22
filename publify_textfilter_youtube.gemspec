# frozen_string_literal: true

# Maintain your gem's version:
require_relative "lib/publify_textfilter_youtube/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "publify_textfilter_youtube"
  s.version     = PublifyTextfilterYoutube::VERSION
  s.authors     = ["Brad Johnson"]
  s.email       = ["climatebrad@gmail.com"]
  s.homepage    = "https://github.com/climatebrad/publify_textfilter_youtube"
  s.summary     = "Youtube text filter for the Publify blogging system."
  s.description = "Youtube text filter sidebar for the Publify blogging system."
  s.license     = "MIT"

  s.files       = File.open("Manifest.txt").readlines.map(&:chomp)

  s.required_ruby_version = ">= 3.0.0"

  s.add_dependency "publify_core", "~> 10.0.0"

  s.add_development_dependency "rspec-rails", "~> 6.0"
  s.add_development_dependency "rubocop", "~> 1.63.1"
  s.add_development_dependency "rubocop-performance", "~> 1.21.1"
  s.add_development_dependency "rubocop-rails", "~> 2.25.0"
  s.add_development_dependency "rubocop-rspec", "~> 3.0.1"
  s.add_development_dependency "simplecov", "~> 0.22.0"
  s.add_development_dependency "sqlite3", "~> 1.4"
  s.metadata["rubygems_mfa_required"] = "true"
end
