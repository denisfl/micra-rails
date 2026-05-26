# frozen_string_literal: true

require_relative "lib/micra/rails/version"

Gem::Specification.new do |spec|
  spec.name = "micra-rails"
  spec.version = Micra::Rails::VERSION
  spec.authors = ["Denis Fedosov-Ledovskikh"]
  spec.email = ["denis@fedosov.me"]

  spec.summary = "Rails integration for Micra.js — reactive UI in ~5 kB, no build step"
  spec.description = <<~DESC
    Drop-in Rails helpers and an importmap pin for Micra.js — a 5 kB reactive
    framework for server-rendered apps. Provides micra_component helper,
    SSR-friendly props via data-* attributes, and a one-command installer.
  DESC
  spec.homepage = "https://github.com/denisfl/micra-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir[
    "lib/**/*",
    "MIT-LICENSE",
    "Rakefile",
    "README.md",
    "CHANGELOG.md"
  ]

  spec.add_dependency "rails", ">= 7.1", "< 9.0"
  spec.add_dependency "importmap-rails", ">= 1.0"

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "sqlite3", "~> 2.0"
end
