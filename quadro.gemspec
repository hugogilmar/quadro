$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quadro/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quadro"
  s.version     = Quadro::VERSION
  s.authors     = ["Hugo Gilmar Erazo"]
  s.email       = ["hugogilmar@nanotutoriales.com"]
  s.homepage    = "https://github.com/hugogilmar/quadro"
  s.summary     = "Quadro CMS"
  s.description = "Quadro Content Management System"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"

  s.add_dependency "ancestry", "~> 2.1"
  s.add_dependency "paranoia", "~> 2.1"
  s.add_dependency "kaminari", "~> 0.17"
  s.add_dependency "kaminari-bootstrap", "~> 3.0"
  s.add_dependency "haml-rails", "~> 0.9"
  s.add_dependency "simple_form", "~> 3.2"
  s.add_dependency "crummy", "~> 1.8"
  s.add_dependency "stringex", "~> 2.6"

  s.add_dependency "devise", "~> 4.2"
  s.add_dependency "paperclip", "~> 5.0"
  s.add_dependency "configatron", "~> 4.5"

  s.add_dependency "sitemap_notifier", "~> 1.0"

  s.add_dependency "jquery-rails", "~> 4.1"
  s.add_dependency "remotipart", "~> 1.2"
  s.add_dependency "coffee-rails", "~> 4.2"
  s.add_dependency "sass-rails", "~> 4.0"
  s.add_dependency "compass-rails", "~> 2.0"
  s.add_dependency "bootstrap-sass", "~> 3.3"
  s.add_dependency "font-awesome-sass", "~> 4.6"
  s.add_dependency "animate", "~> 0.1"

  s.add_dependency "codemirror-rails", "~> 5.11"
  s.add_dependency "summernote-rails", "~> 0.8"
  s.add_dependency "jquery-slick-rails", "~> 1.6"
  s.add_dependency "momentjs-rails", "~> 2.11"
  s.add_dependency "video_info", "~> 2.6"

  s.add_dependency "rails-i18n", "~> 4.0"
  s.add_dependency "devise-i18n", "~> 1.1"
  s.add_dependency "kaminari-i18n", "~> 0.4"

  s.add_dependency "unobtrusive_flash", "~> 3.2"

  s.add_dependency "gravatar_image_tag", "~> 1.2"
  s.add_dependency "turnout", "~> 2.3"
  s.add_dependency "useragent", "~> 0.16"
  s.add_dependency "maxminddb", "~> 0.1"

  s.add_development_dependency "sqlite3", "~> 1.3"
  s.add_development_dependency "thin", "~> 1.7"
  s.add_development_dependency "better_errors", "~> 2.1"
  s.add_development_dependency "binding_of_caller", "~> 0.7"
  s.add_development_dependency "codeclimate-test-reporter", "~> 0.6"
  s.add_development_dependency "i18n-debug", "~> 1.1"
end
