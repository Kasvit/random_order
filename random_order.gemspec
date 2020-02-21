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
  spec.description = "With this gem you can return a random record from database using SQL or using `randomscope` to return records in random order"
  spec.summary     = "This gem is adding three methods to ActiveRecord Relations - `random` , `find_random` and `find_many_random(...)`."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "postgres"
end
