require 'pry'

class Player

  attr_accessor :name, :life_points

  def initialize(name) #Les attributs d'un joueur
    @name = name
	@life_points = 10
  end

  def show_state #affiche l'état de l'objet Player
    return "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage) #prend en entrée un integer (= le nombre de dommages subit) et qui le soustraie au niveau de vie (@life_points) du joueur
    @life_points = @life_points - damage
    if @life_points <= 0
    	puts "Le joueur #{@name} a été tué !"
    end
  end

  def compute_damage #generates a random number between 1 and 6
    return rand(1..6)
  end

  def attacks(player) #permets de faire qu'un joueur attaque un autre
  	puts "#{@name} attaque #{player.name}"
    attack = compute_damage
    puts "il lui inflige #{attack} points de dommages"
    return player.gets_damage(attack)
  end

end

class HumanPlayer < Player
  
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state #affiche l'état de l'objet Player
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage #generates a random number between 1 and 6
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends." 
      @weapon_level = new_weapon
    else
      puts "M@*!$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
  	health_pack = rand(1..6)
  	if health_pack == 1
  	  puts "Tu n'as rien trouvé..."
  	elsif health_pack >= 2 && health_pack <= 5
  	  @life_points = @life_points + 50
  	  puts "Bravo, tu as trouvé un pack de +50 points de vie !" 
  	elsif health_pack == 6
      while @life_points <= 100 do
  	    @life_points = @life_points + 80
  	  end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
  	end 

  end

end


#binding.pry
