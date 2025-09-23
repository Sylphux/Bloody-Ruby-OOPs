require 'bundler'
require 'etc'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/visuals'

def show_all_player_state
    for p in HumanPlayer.all
        p.show_player_state
    end
    for p in Player.all
        p.show_player_state
    end
end

def get_player_by_name(who)
    #if no entry, random pick
    if who == ""
        counted = Player.all.count() - 1
        aim = rand(0..counted)
        while (Player.all[aim].is_alive == false)
            aim = rand(0..counted)
        end
        return Player.all[aim]
    end
    #if we have an entry, we use it
    for p in Player.all
        if who == p.name
            return p 
        end
    end
end

def arena_row_human
    puts
    for h in HumanPlayer.all
        puts "#{h.name}'s turn !"
        h.show_player_state
        puts "FIGHT (f), Heal (h), Upgrade (w)"
        ask = gets.chomp.to_s
        if ask == "f" or ask == ""
            puts "Who would you like to attack (Enter for random)"
            ask2 = gets.chomp.to_s
            defend = get_player_by_name(ask2)
            h.attacks(defend)
        elsif ask == "h"
            h.search_hp
        elsif ask == "w"
            h.search_wpn
        end
    end
end

def arena_row_bots(bots, user)
    for b in bots
        if b.is_alive
            b.attacks(user)
        end
    end
end

def arena(bots, user)
    puts "\nArena mode is starting."
    round = 1
    #while player or one of the two bots are alive
    while user.hp > 0 && (bots[0].hp > 0 || bots[1].hp > 0)
        put_round(round)
        arena_row_human
        arena_row_bots(bots, user)
        round += 1
    end
end

def create_user_player
    while true
        puts "\nWhat will be your name ?"
        ask = gets.chomp.to_s
        if ask == ""
            ask = Etc.getlogin
        end
        user = HumanPlayer.new(ask)
        return user
    end
end

def create_ennemies
    puts "How many ennemies ?"
    nb = gets.chomp
    if nb == ""
        nb = rand(1..6)
    end
    nb = nb.to_i
    puts "You created #{nb.to_s} ennemies"
    bots = []
    i = 1
    nb.times do
        Player.new("lord#{i.to_s}")
        bots << Player.all[i-1]
        i += 1
    end
    return bots
end

def perform
    greet
    bots = create_ennemies
    user = create_user_player
    arena(bots, user)
    game_ov
end

perform