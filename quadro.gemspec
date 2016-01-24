$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quadro/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quadro"
  s.version     = Quadro::VERSION
  s.authors     = ["Hugo Gilmar Erazo"]
  s.email       = ["hugogilmar@gmail.com"]
  s.homepage    = "https://github.com/hugogilmar/quadro"
  s.summary     = "Quadro CMS"
  s.description = "Quadro Content Management System"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.20"

  s.add_dependency "ancestry", "~> 2.1.0"
  s.add_dependency "paranoia", "~> 1.0"
  s.add_dependency "kaminari", "~> 0.16.3"
  s.add_dependency "kaminari-bootstrap", "~> 3.0.1"
  s.add_dependency "haml-rails", "~> 0.4"
  s.add_dependency "simple_form", "~> 2.1.1"
  s.add_dependency "crummy", "~> 1.8.0"
  s.add_dependency "stringex", "~> 2.5.2"

  s.add_dependency "devise", "~> 3.4.1"
  s.add_dependency "paperclip", "~> 4.2.0"
  s.add_dependency "figaro", "~> 1.1.1"
  s.add_dependency "dynamic_sitemaps", "1.0.8"

  s.add_dependency "jquery-rails", "~> 3.1.2"
  s.add_dependency "remotipart", "~> 1.0"
  s.add_dependency "coffee-rails", "~> 3.2.2"
  s.add_dependency "sass-rails", "~> 3.2.6"
  s.add_dependency "compass-rails", "~> 2.0.1"
  s.add_dependency "bootstrap-sass", "~> 3.3.1.0"
  s.add_dependency "font-awesome-sass", "~> 4.2.2"
  s.add_dependency "animate", "~> 0.1.0"

  s.add_dependency "codemirror-rails", "~> 4.5"
  s.add_dependency "summernote-rails", "~> 0.5.10.2"
  s.add_dependency "jquery-slick-rails", "~> 1.5.9.1"
  s.add_dependency "photoswipe-rails", "~> 4.1.0"

  s.add_dependency "rails-i18n", "~> 3.0.0"
  s.add_dependency "devise-i18n", "~> 0.12.1"
  s.add_dependency "kaminari-i18n", "~> 0.3.2"

  s.add_dependency "gravatar_image_tag", "~> 1.2.0"

  s.add_development_dependency "sqlite3"
end
