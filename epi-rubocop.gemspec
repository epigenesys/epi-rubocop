Gem::Specification.new do |s|
  s.name = "epi-rubocop"
  s.summary = "Ruby, Rails and RSpec coding standards for epiGenesys software engineers"
  s.authors = ["Jack Slinger", "James Gregory-Monk"]
  s.email = "info@epigenesys.org.uk"

  s.license = "MIT"

  s.version = "1.1.0"
  s.platform = Gem::Platform::RUBY

  s.add_dependency "rubocop", ">= 1.74"
  s.add_dependency "rubocop-rails-omakase", ">= 1.1.0" 
  s.add_dependency "rubocop-rails", ">= 2.30"
  s.add_dependency "rubocop-performance", ">= 1.24"
  s.add_dependency "rubocop-rspec", ">= 2.22.0"

  s.files = %w[ rubocop.yml ]
end