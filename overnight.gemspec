$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "overnight"
  s.version     = 0.1
  s.authors     = "Alan L. Davis"
  s.summary     = "Mundane stopwatch with a cool name"
  s.description = "Mundane stopwatch with a cool name. Will be possible to use for logging time slightly easier than finding puts statements hopefully"
  s.source    = 'https://github.com/adavidev/overnight'

  s.files = Dir["{lib}/**/*"] + ["README.rdoc"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-core"
end
