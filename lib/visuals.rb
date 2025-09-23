def put_round(round)
        puts "\n---------------------------------------------"
        puts "                round #{round}               "
        puts "---------------------------------------------"
        show_all_player_state
        puts "---------------------------------------------"
end

def greet
    puts "------------------------------------------------"
    puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "-------------------------------------------------"
end

def game_ov(user)
    puts "\n---------------------------------------------"
    puts "                GAME OVER                      "
    if user.hp > 0
        puts "Congrats #{user.name}, you won !"
    else
        puts "Noob, you lost."
    end
    puts "---------------------------------------------"
end