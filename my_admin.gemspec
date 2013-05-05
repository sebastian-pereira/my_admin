$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "my_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "my_admin"
  s.version     = MyAdmin::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MyAdmin."
  s.description = "TODO: Description of MyAdmin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"

  s.add_development_dependency "mysql2"
  s.add_development_dependency "haml-rails"
  s.add_development_dependency "my_fields"
  s.add_development_dependency "sass-rails"
end
