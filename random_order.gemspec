$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "random_order/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "random_order"
  spec.version     = RandomOrder::VERSION
  spec.authors     = ["Vitalii Kasianchuk"]
  spec.email       = ["kasvit93@gmail.com"]
  spec.homepage    = "https://github.com/Kasvit/random_order"
  spec.summary     = "Find random record in your models, just to DRY your code."
  spec.description = "Find random record in your models, just to DRY your code."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails"

  spec.add_development_dependency "sqlite3"
end
