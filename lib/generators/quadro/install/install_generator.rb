class Quadro::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def install
    route "mount Quadro::Engine => '/'"

    rake "quadro:install:migrations"
    rake "db:migrate"
    rake "quadro:create_root_page"

    copy_file "config/application.yml", "config/application.yml"

    copy_file "app/views/quadro/shared/_page_header.html.haml", "app/views/quadro/shared/_page_header.html.haml"
    copy_file "app/views/quadro/shared/_page_content.html.haml", "app/views/quadro/shared/_page_content.html.haml"
    copy_file "app/views/quadro/shared/_navigation.html.haml", "app/views/quadro/shared/_navigation.html.haml"
    copy_file "app/views/quadro/shared/templates/_blank.html.haml", "app/views/quadro/shared/templates/_blank.html.haml"
    copy_file "app/views/quadro/shared/templates/_sidebar.html.haml", "app/views/quadro/shared/templates/_sidebar.html.haml"

    remove_file "public/index.html"
  end
end
