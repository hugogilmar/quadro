class Quadro::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def install
    route "mount Quadro::Engine => '/'"

    copy_file "db/GeoLite2-Country.mmdb", "db/GeoLite2-Country.mmdb"

    copy_file "config/application.yml", "config/application.yml"
    copy_file "config/initializers/quadro.rb", "config/initializers/quadro.rb"
    copy_file "app/views/quadro/shared/templates/page/_list.html.haml", "app/views/quadro/shared/templates/page/_list.html.haml"
    copy_file "app/views/quadro/shared/templates/page/_thumbnail.html.haml", "app/views/quadro/shared/templates/page/_thumbnail.html.haml"
    copy_file "app/views/quadro/shared/_navigation.html.haml", "app/views/quadro/shared/_navigation.html.haml"
    copy_file "app/views/quadro/shared/templates/_blank.html.haml", "app/views/quadro/shared/templates/_blank.html.haml"
    copy_file "app/views/quadro/shared/templates/_jumbotron.html.haml", "app/views/quadro/shared/templates/_jumbotron.html.haml"
    copy_file "app/views/quadro/shared/templates/_sidebar.html.haml", "app/views/quadro/shared/templates/_sidebar.html.haml"
    copy_file "app/views/quadro/shared/templates/_demo.html.haml", "app/views/quadro/shared/templates/_demo.html.haml"
    copy_file "app/assets/javascripts/quadro/site.js.coffee", "app/assets/javascripts/quadro/site.js.coffee"
    copy_file "app/assets/stylesheets/quadro/site.css.sass", "app/assets/stylesheets/quadro/site.css.sass"
    copy_file "app/assets/images/quadro/favicon.ico", "app/assets/images/quadro/favicon.ico"
    copy_file "public/maintenance.html", "public/maintenance.html"
    copy_file "public/quadro-maintenance.png", "public/quadro-maintenance.png"

    remove_file "public/index.html"
    remove_file "public/favicon.ico"

    rake "quadro:install:migrations"
    rake "db:migrate"
    rake "quadro:create_root_page"
    rake "quadro:create_admin_user"
  end
end
