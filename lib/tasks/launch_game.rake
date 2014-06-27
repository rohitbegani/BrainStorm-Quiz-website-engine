namespace :game do
  desc "Launch the game"
  task :launch => :environment do
    if Game.all.empty?
      Game.create(:is_playable => false)
    end
    Game.first.update_attributes(:is_playable => true)
    puts "BrainStorm has begun..."
    puts "Use rake game:kill to kill the game"
  end
end