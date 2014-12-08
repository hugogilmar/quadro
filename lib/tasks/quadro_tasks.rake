namespace :quadro do
  desc 'Create root page for Quadro CMS'
  task :create_root_page => :environment do |task|
    unless Quadro::Page.any?
      Quadro::Page.create(title: 'Home', template: 'sidebar')
    end
  end

  desc 'Create admin user for Quadro CMS'
  task :create_admin_user => :environment do |task|
    unless Quadro::User.any?
      Quadro::User.create(email: 'quadro@example.com', password: 'quadro123', password_confirmation: 'quadro123')
    end
  end
end
