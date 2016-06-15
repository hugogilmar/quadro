namespace :quadro do
  desc 'Create admin user for quadro'
  task :create_admin_user => :environment do |task|
    unless Quadro::User.any?
      Quadro::User.create(name: 'Quadro', email: 'quadro@example.com', password: 'quadro123', password_confirmation: 'quadro123')
    end
  end

  desc 'Create root page for quadro'
  task :create_root_page => :environment do |task|
    unless Quadro::Page.any?
      Quadro::Page.create(title: 'Home', summary: 'Welcome to Quadro CMS', template: 'demo', author_id: Quadro::User.first.try(:id))
    end
  end
end
