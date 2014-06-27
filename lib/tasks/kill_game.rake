namespace :game do
  desc "Kill the game"
  task :kill => :environment do
    Game.first.update_attributes(:is_playable => false)
    puts "BrainStorm has been killed, blow the smoke, hide the gun.....AND RUN!!"
  end
end