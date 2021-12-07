#TODO Add luck mechanic to fight
class Fighter
  attr_reader :name
  attr_accessor :defense
  attr_accessor :strength 
  attr_accessor :luck
  attr_accessor :life 
  
  def initialize (name, defense, strength, luck, life)
    @name = name
    @defense = defense
    @strength = strength
    @luck = luck
    @life = life
  end
  
  def lucky_roll? 
    roll = rand(@luck...10)
    roll == 9
  end

  def attack opp
    damage = @strength - opp.defense
    if damage <= 0
      puts "#{name} was blocked by #{opp.name} and did 0 damage"
    else
      if self.lucky_roll?
        puts "\n-------Lucky Roll-------\n"
        puts "Your luck paid off with a critical hit"
      damage *= 2
      end

      opp.life -= damage
      if opp.life < 0
        opp.life = 0
      end
      puts "#{name} did #{damage} damage to #{opp.name}. #{opp.name} has #{opp.life} life points left"
      
    end

  end

end


# ken = Fighter.new("Ken", 5,5,5,5)
# ryu = Fighter.new("Ryu", 7,7,7,7)

# puts ken.life
# ryu.attack(ken)
# puts ken.life


class Dojo
  
  def self.lift_weights fighter
    fighter.strength += 1
    puts "You are getting stronger"
    if fighter.lucky_roll?
      puts "\n-------Lucky Roll-------\n"
      fighter.strength +=1  
      puts "Your luck paid off with an additional point in strength"
    end
    puts "Your strength increased to #{fighter.strength}"
    
    
  end
  
  def self.endurance_training(fighter)
    fighter.defense += 1
    puts "You feel your defense getting stouter"
    if fighter.lucky_roll?
      puts "\n-------Lucky Roll-------\n"
      fighter.defense +=1  
      puts "Your luck paid off with an additional point in defense"
    end
    puts "Your defense increased to #{fighter.defense}"
    
  end
  
  def self.coin_in_fountain(fighter)
    if fighter.luck >= 8
      puts "You cannot fit more than 8 rabbit's feet in your inventory, your luck is maxed out!"
      fighter.life +=2
      puts "As a consolation, the cosmos has given you a couple additional points in life "
    else 
      fighter.luck += 1
      puts "You flip a coin into the fountain. As you turn to leave you stumble upon a lucky rabbit's foot and add it to inventory"
      if fighter.lucky_roll? && fighter.luck < 7
        puts "\n-------Lucky Roll-------\n"  
        fighter.luck +=1  
        puts "Your luck paid off with an additional point in luck"
      end
      puts "Your luck increased to #{fighter.luck}"
    end
  end
  
  def self.rest_up(fighter)
    fighter.life += 2
    puts "You did not do anything productive this week. Your body feels invigorated by the extra rest"
    if fighter.lucky_roll?
      puts "\n-------Lucky Roll-------\n"
      fighter.life +=2  
      puts "Your luck paid off with 2 additional points in life"
    end
    puts "Your life points increased to #{fighter.life}"
  end
end

def game 
  
  def welcome 
    puts "Welcome to Dojo Fighter, new recruit. What is your name?"
    name = gets
    player = Fighter.new(name, 0, 0, 0, 10)
    p player
  end

  def create_opponent
    roster = ["Shredder", "Krang", "Leatherhead", "Baxter Shockman", "Slash"]
    opponent_name = roster.sample()
    opponent = Fighter.new(opponent_name,4,4,4,10)
    p opponent
  end
  welcome
  create_opponent
  p player
end
#----------------------
# GAME
#----------------------
puts " ______      ___       _____   ___    "
puts "|_   _ `.  .'   `.    |_   _|.'   `.  "
puts "  | | `. \\/  .-.  \\     | | /  .-.  \\ "
puts "  | |  | || |   | | _   | | | |   | | "
puts " _| |_.' /\\  `-'  /| |__' | \\  `-'  / "
puts "|______.'  `.___.' `.____.'  `.___.'  "

puts " ________  _____   ______  ____  ____  _________  ________  _______    "
puts "|_   __  ||_   _|.' ___  ||_   ||   _||  _   _  ||_   __  ||_   __ \\   "
puts "  | |_ \\_|  | | / .'   \\_|  | |__| |  |_/ | | \\_|  | |_ \\_|  | |__) |  "
puts "  |  _|     | | | |   ____  |  __  |      | |      |  _| _   |  __ /   "
puts " _| |_     _| |_\\ `.___]  |_| |  | |_    _| |_    _| |__/ | _| |  \\ \\_ "
puts "|_____|   |_____|`._____.'|____||____|  |_____|  |________||____| |___|"

puts "\nWelcome to Dojo Fighter, new recruit. What is your name?"
name = gets.strip
player = Fighter.new(name, 0, 0, 0, 10)
puts "#{player.name}, eh? Okay, I'll get you signed in."
puts "Alright, give me one second while I determine your next opponent"
puts "..."
puts "..."
puts "..."

roster = ["Shredder", "Krang", "Leatherhead", "Baxter Shockman", "Slash"]
conflicts = ["dentist appointment", "family reunion", "ribbon cutting ceremony", "big gala", "bowling match"]

opponent_name = roster.sample()
def opponent_art name
  case name
  when "Shredder"
    puts " _____ _   _ ______ _________________ ___________ "
    puts "/  ___| | | || ___ \\  ___|  _  \\  _  \\  ___| ___ \\"
    puts "\\ `--.| |_| || |_/ / |__ | | | | | | | |__ | |_/ /"
    puts " `--. \\  _  ||    /|  __|| | | | | | |  __||    / "
    puts "/\\__/ / | | || |\\ \\| |___| |/ /| |/ /| |___| |\\ \\ "
    puts "\\____/\\_| |_/\\_| \\_\\____/|___/ |___/ \\____/\\_| \\_|"
  when "Krang"
    puts " _   ________  ___   _   _ _____ "
    puts "| | / /| ___ \\/ _ \\ | \\ | |  __ \\"
    puts "| |/ / | |_/ / /_\\ \\|  \\| | |  \\/"
    puts "|    \\ |    /|  _  || . ` | | __ "
    puts "| |\\  \\| |\\ \\| | | || |\\  | |_\\ \\"
    puts "\\_| \\_/\\_| \\_\\_| |_/\\_| \\_/\\____/"
  when "Leatherhead"
    puts " _      _____  ___ _____ _   _  ___________ "
    puts "| |    |  ___|/ _ \\_   _| | | ||  ___| ___ \\"
    puts "| |    | |__ / /_\\ \\| | | |_| || |__ | |_/ /"
    puts "| |    |  __||  _  || | |  _  ||  __||    / "
    puts "| |____| |___| | | || | | | | || |___| |\\ \\ "
    puts "\\_____/\\____/\\_| |_/\\_/ \\_| |_/\\____/\\_| \\_|"
    puts " _   _  _____  ___ ______ "
    puts "| | | ||  ___|/ _ \\|  _  \\"
    puts "| |_| || |__ / /_\\ \\ | | |"
    puts "|  _  ||  __||  _  | | | |"
    puts "| | | || |___| | | | |/ / "
    puts "\\_| |_/\\____/\\_| |_/___/  "
  when "Baxter Shockman"
    puts "______  ___  __   _______ ___________ "
    puts "| ___ \\/ _ \\ \\ \\ / /_   _|  ___| ___ \\"
    puts "| |_/ / /_\\ \\ \\ V /  | | | |__ | |_/ /"
    puts "| ___ \\  _  | /   \\  | | |  __||    / "
    puts "| |_/ / | | |/ /^\\ \\ | | | |___| |\\ \\ "
    puts "\\____/\\_| |_/\\/   \\/ \\_/ \\____/\\_| \\_|"
    puts " _____ _   _ _____ _____  _   _____  ___  ___   _   _ "
    puts "/  ___| | | |  _  /  __ \\| | / /|  \\/  | / _ \\ | \\ | |"
    puts "\\ `--.| |_| | | | | /  \\/| |/ / | .  . |/ /_\\ \\|  \\| |"
    puts " `--. \\  _  | | | | |    |    \\ | |\\/| ||  _  || . ` |"
    puts "/\\__/ / | | \\ \\_/ / \\__/\\| |\\  \\| |  | || | | || |\\  |"
    puts "\\____/\\_| |_/\\___/ \\____/\\_| \\_/\\_|  |_/\\_| |_/\\_| \\_/"
  when "Slash"  
    puts " _____ _       ___   _____ _   _ "
    puts "/  ___| |     / _ \\ /  ___| | | |"
    puts "\\ `--.| |    / /_\\ \\\\ `--.| |_| |"
    puts " `--. \\ |    |  _  | `--. \\  _  |"
    puts "/\\__/ / |____| | | |/\\__/ / | | |"
    puts "\\____/\\_____/\\_| |_/\\____/\\_| |_/"
  end
end
opponent = Fighter.new(opponent_name,rand(7),rand(7),rand(5), 10)
puts "Your opponent for the upcoming match is:"
opponent_art opponent_name
puts "\nBetter start training, this will be a tough one!"
x = 1
y = 11
while x < y
  puts "\n-----Training week #{x}-----"
  puts "How would you like to train? Please select lifting weights, endurance exercises, or visit the fountain"
  choice = gets.downcase

  if choice.include? "fountain" 
    Dojo.coin_in_fountain(player)
  elsif choice.include? "weights" 
    Dojo.lift_weights(player)
  elsif choice.include? "endurance" 
    Dojo.endurance_training(player)
  else 
    Dojo.rest_up(player)
  end
  
  if player.lucky_roll?
    puts "\n-------Lucky Roll-------\n"
    puts "It's your lucky day kid, #{opponent.name} has a #{conflicts.sample} the day of the fight"
    puts "Would you like an extra week to continue your training? (y/n)"
    extra_week = gets.strip
    extra_week.downcase!
    if extra_week == "y"
      y += 1
      puts "Great, use your extra time wisely!"
    else
      puts "Wow you must be feeling confident. I'll tell #{opponent.name} he'll have to cancel his conflict"
    end    
  end


  x += 1 

end

puts "I hope you used your time wisely, It's the day of the big fight!"
puts "Are you ready, #{player.name} (y/n)"
ready = gets.strip.downcase
case ready
when "y", "yes"
  puts "That's what I like to hear! Let's begin the match!"
when "n", "no"
  puts "It's too late to back out now kid, the crowd is waiting! Let's begin the match!"
else
  puts "What's that kid? I couldn't understand you. Anyway, let's start the match!"
end
puts "________  _____   ______  ____  ____  _________  "
puts "|_   __  ||_   _|.' ___  ||_   ||   _||  _   _  | "
puts "  | |_ \\_|  | | / .'   \\_|  | |__| |  |_/ | | \\_| "
puts "  |  _|     | | | |   ____  |  __  |      | |     "
puts " _| |_     _| |_\\ `.___]  |_| |  | |_    _| |_    "
puts "|_____|   |_____|`._____.'|____||____|  |_____|   "

loop do
  player.attack(opponent)
  if opponent.life <= 0
    puts "#{player.name} defeated #{opponent.name} pop the champaigne!"
    break
  end
  opponent.attack(player)
  if player.life <= 0
    puts "#{player.name} was defeated by #{opponent.name}. You'll have to take your training more seriously next time if you want to become the champ."
    break
  elsif player.strength < opponent.defense && opponent.strength < player.defense
    puts "Both fighters lack the strength to damage their opponent. The match ends in a tie. This was a very boring match."
    break
  end
  
  puts "Press enter to begin the Next Round"
  gets

  puts "\n\n-------------NEXT ROUND-------------\n\n"

end



