namespace :quadro do
  desc 'Create root page for Quadro CMS'
  task :create_root_page => :environment do |task|
    unless Quadro::Page.any?
      Quadro::Page.create(title: 'Home', template: 'sidebar')
    end
  end

  desc 'Create admin user for Quadro CMS'
  task :create_admin_user => :environment do |task|
    unless Quadro::Page.any?
      Quadro::User.create(email: 'quadro@example.com', password: 'quadro123', password_confirmation: 'quadro123')
      puts 'Quadro Admin User'
      puts 'username: quadro@example.com'
      puts 'password: quadro123'
    end
  end
end
