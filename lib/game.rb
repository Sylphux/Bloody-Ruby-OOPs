class Game

    @@ennemy_counter = 0

    def show_all_player_state
        for p in HumanPlayer.all
            p.show_player_state
        end
        for p in Player.all
            p.show_player_state
        end
    end

    def get_player_by_name(who)
        if who == ""                            #if no entry, random pick
            counted = Player.all.count() - 1
            aim = rand(0..counted)
            while (Player.all[aim].is_alive == false)
                aim = rand(0..counted)
            end
            return Player.all[aim]
        end                             
        for p in Player.all                     #if we have an entry, we use it
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

    def arena_row_bots
        for b in Player.all
            if b.is_alive
                if HumanPlayer.all[0].is_alive
                    b.attacks(HumanPlayer.all[0])
                end
            end
        end
    end

    def spawner
        dice = rand(1..8)                       #spawn a minion
        if (1..2).include?(dice)
            @@ennemy_counter += 1
            Player.new("Creep#{@@ennemy_counter}")
        end
        if dice == 3
            @@ennemy_counter += 1
            Boss.new("Boss#{@@ennemy_counter}")
        end
    end

    def arena
        user = HumanPlayer.all[0]
        puts "\nArena mode is starting."
        round = 1
        all_bot_hp = 100
        while user.hp > 0 && (all_bot_hp > 0)   #while player or one of the two bots are alive
            spawner                             #spawns ennemies randomly
            put_round(round)
            arena_row_human
            arena_row_bots
            round += 1
            all_bot_hp = 0                      #Calculate total bot hp (if ennemies are stil allive)
            for n in Player.all
                if n.hp > 0
                    all_bot_hp += n.hp
                end
            end
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
        puts "How many ennemies (to start with) ?"
        nb = gets.chomp
        if nb == ""
            nb = rand(3..6)
        end
        nb = nb.to_i
        puts "You creating #{nb.to_s} ennemies"
        nb.times do                             #create bots
            @@ennemy_counter += 1
            Player.new("lord#{@@ennemy_counter}")
        end
    end

    def initialize(game_name)
        greet
        create_ennemies
        create_user_player
        arena
        game_ov
    end

end