namespace :game do
  desc "Setup the game for first run"
  task :initialize => :environment do
    puts "Setting first user as god..0%...50%...100% Completed"
    unless User.all.empty?
      User.first.toggle!(:admin)
     
      puts "Initializing the game..."
      puts "0%..."
      puts "...50%..."
      puts "...100%"
      puts "Initialized!!"
      if Game.all.empty?
        Game.create!
      end
      puts "Run rake game:launch to switch it on!"
    else
      puts "Please run 'rake db:create' and 'rake db:migrate' first"
      puts "Also, no user is currently present. How do you expect me to set the first user admin? -.-"
    end
  end
end