namespace :dev do
  desc 'Development env config'
  task setup: :environment do
    if Rails.env.development?
      puts 'Droping database'
      %x(rails db:drop)
      puts 'Creating database'
      %x(rails db:create)
      puts 'Migrating database'
      %x(rails db:migrate)
      if Admin.table_exists?
        puts 'Creating admin'
        %x(rails dev:create_admin)
      end
      if User.table_exists?
        puts 'Creating user'
        %x(rails dev:create_user)
      end
    else
      puts "Wrong env: #{Rails.env}"
    end
  end

  DEFAULT_PASSWORD = '123456'

  desc 'Create admin'
  task create_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end
  
  desc 'Create user'
  task create_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end
end
