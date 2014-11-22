$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quadro/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quadro"
  s.version     = Quadro::VERSION
  s.authors     = ["Hugo Gilmar Erazo"]
  s.email       = ["hugogilmar@gmail.com"]
  s.homepage    = "http://www.nanotutoriales.com"
  s.summary     = "Quadro"
  s.description = "All required libraries to initialize a Rails project"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.20"

  s.add_dependency "jquery-rails", "~> 3.1.2"
  s.add_dependency "coffee-rails", "~> 3.2.2"
  s.add_dependency "sass-rails", "~> 3.2.3"
  s.add_dependency "bootstrap-sass", "~> 3.3.0.1"
  s.add_dependency "font-awesome-sass", "~> 4.2.2"
  s.add_dependency "compass-rails", "~> 2.0.1"
  s.add_dependency "animate", "~> 0.1.0"

  s.add_development_dependency "sqlite3"
end
