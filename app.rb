require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/visuals'

#binding.pry

def show_all_player_state
    for p in Player.all
        p.show_player_state
    end
    for p in HumanPlayer.all
        p.show_player_state
    end
end

def direct_atk(lordress, lord)
    bam = rand(1..10)
    puts "lordress attacks lord with #{bam} dmg."
    lord.gets_damage(bam)
end

def start_duel(lord, lordress)
    while true
        puts
        lordress.attacks(lord)
        if lord.hp < 1
            break
        end
        lord.attacks(lordress)
        if lordress.hp < 1
            break
        end
    end
    puts "\nFight is over. GG."
end

def perform
    lord = Player.new("Lord")
    lordress = Player.new("Lordress")
    show_all_player_state
    start_duel(lord, lordress)
end

perform