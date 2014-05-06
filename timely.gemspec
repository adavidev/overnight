$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "timely"
  s.version     = 0.1
  s.authors     = "Alan L. Davis"
  s.summary     = "App to log timing."
  s.description = "see summary..."

  s.files = Dir["{config,lib}/**/*"] + ["README.rdoc"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-core"
end
