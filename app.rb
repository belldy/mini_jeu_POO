require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

#création de joueurs
player1 = Player.new("Josiane")
player2 = Player.new("José")

#boucle que permet le combat
while player1.life_points > 0 || player2.life_points > 0 do
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state
  puts "\n"
  puts "Passons à la phase d'attaque"

  player1.attacks(player2)
    if player2.life_points <= 0 #condition pour finir la partie si player2 est mort avant le fin de la boucle while
      break
    end
  player2.attacks(player1)
end



binding.pry