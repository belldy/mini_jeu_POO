require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

puts "**************************************"
puts "              Welcome to              "
puts "            DRi's_FiRsT_GAmE          "
puts "                by :Dri               "
puts "        ARE YOU READY TO BEGIN?       "
puts "             LET'S PLAY_o/            "
puts "**************************************"
puts "\n"

puts "Quel est ton prénon ?"
name = gets.chomp.to_s
user = HumanPlayer.new(name)

enemies = [player1 = Player.new("Josiane"), player2 = Player.new("José")]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  user.show_state
puts "\n"
puts "Quelle action veux-tu effectuer ?"
puts "\n"
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner"
puts "\n"
puts "Attaquer un joueur en vue :"
puts "0 - #{player1.show_state}"
puts "1 - #{player2.show_state}"

puts "\n"
input = gets.chomp.to_s
puts "\n"


  if input == "a"
    user.search_weapon
  elsif input == "s"
  	user.search_health_pack
  elsif input == "0"
  	user.attacks(player1)
  elsif input == "1"
  	user.attacks(player2)
  end

puts "\n"
puts "Les autres joueurs t'attaquent !"
puts "\n"

  enemies.each do |players|
  	if players.life_points <= 0
  	  break
  	else
  	  players.attacks(user)
  	end
  end

puts "\n"

  if user.life_points >= 1
  	puts "BRAVO ! TU AS GAGNE !"
  else
  	puts "Tu as perdu !"
  end

puts "\n"
puts "**********"
puts "\n"

end