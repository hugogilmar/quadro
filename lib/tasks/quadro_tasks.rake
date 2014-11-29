namespace :quadro do
  desc 'Create root page for Quadro CMS'
  task :create_root_page => :environment do |task|
    unless Quadro::Page.any?
      Quadro::Page.create(title: 'Home', template: 'sidebar')
    end
  end
end
