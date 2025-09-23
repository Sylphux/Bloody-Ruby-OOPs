def put_round(round)
        puts "\n---------------------------------------------"
        puts "                round #{round}               "
        puts "---------------------------------------------"
        show_all_player_state
        puts "---------------------------------------------"
end

def greet
    puts "------------------------------------------------"
    puts "|Welcome in bloody_ruby_OOPs !                 |"
    puts "|Be the last one alive !                       |"
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