Gem::Specification.new do |s|
  s.name = "rubocop-epigenesys-hr"
  s.summary = "Ruby coding standard for the HR team of epigenesys"
  s.authors = ["Jack Slinger", "James Gregory-Monk"]
  s.email = "info@epigenesys.org.uk"

  s.license = "MIT"

  s.version = "0.0.1"
  s.platform = Gem::Platform::RUBY

  s.add_dependency "rubocop", ">= 1.74"
  s.add_dependency "rubocop-rails-omakase", ">= 1.1.0" 
  s.add_dependency "rubocop-rails", ">= 2.30"
  s.add_dependency "rubocop-performance", ">= 1.24"

  s.files = %w[ rubocop.yml ]
end