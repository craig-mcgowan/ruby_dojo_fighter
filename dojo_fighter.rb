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

  def attack opp
    damage = @strength - opp.defense
    if damage <= 0
      puts "#{name} was blocked by #{opp.name} and did 0 damage"
    else
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
    puts "#{fighter.name} is getting stronger"
    puts "#{fighter.name}'s strength increased to #{fighter.strength}"
  end
  
  def self.endurance_training(fighter)
    fighter.defense += 1
    puts "#{fighter.name} feels their defense getting stouter"
    puts "#{fighter.name}'s defense increased to #{fighter.defense}"
  end
  
  def self.coin_in_fountain(fighter)
    fighter.luck += 1
    puts "#{fighter.name} flipped a coin into the fountain. As they turned to leave they stumbled upon a lucky rabbit's foot and added it to inventory"
    puts "#{fighter.name}'s luck increased to #{fighter.luck}"
  end
  
  def self.rest_up(fighter)
    fighter.life += 2
    puts "#{fighter.name} did not do anything productive this week. Their body feels invigorated by the extra rest"
    puts "#{fighter.name}'s life points increased to #{fighter.life}"
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
  
puts "Welcome to Dojo Fighter, new recruit. What is your name?"
name = gets.strip
player = Fighter.new(name, 0, 0, 0, 10)
puts "#{player.name}, eh? Okay, I'll get you signed in."
puts "Alright, give me one second while I determine your next opponent"
puts "..."
puts "..."
puts "..."

roster = ["Shredder", "Krang", "Leatherhead", "Baxter Shockman", "Slash"]

opponent_name = roster.sample()
opponent = Fighter.new(opponent_name,4,4,4,10)
# p opponent
puts "Your opponent for the upcoming match is #{opponent.name}! Better start training, this will be a tough one!"
x = 1
while x < 11
  puts "Training week #{x}... How would you like to train. Please select weights, endurance, or visit the fountain"
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
  puts "###############NEXT ROUND################"
end



