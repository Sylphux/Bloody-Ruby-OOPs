class String
    #création d'une méthode pour coloriser le texte
    def colorize(color_code)
        "\e[#{color_code}m#{self}\e[0m"
    end
end

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

def greet_vampire
    system "clear"
    puts "....@@@@@%........ .......  .. .......@@@@@@@@@....."
    puts "...@=::..+@@@@@@@@@@@@-...#@@@@@@@@@@#:.:+++#%%....."
    puts " ..@%#++*%##-.. .......%@@:.......=*@@@*=-==@...... "
    puts ". ...@%#@=.@%@@++-%%@@@+%#@@@@++#@#@....@.@@........"
    puts ".....=:.=.......@@+  .. @... ..@ ..@ .. @...... ...."
    puts ".... .@-*..@=..... .....*.  ...@....@ .-@.@........."
    puts " ...... @...%@..@...... -......* ..+@. = .... ......"
    puts ".........@%:@ .. @@....@@.:..:=@....@%@@........... "
    puts "..........@+@........ ...... .... ..@@-..... ......."
    puts ". . .... .. .... .................. ... ............"
    puts "............Welcome in bloody_ruby_OOPs !...... ... "
    puts "...... ........Be the last one alive !..............\n\n"
end

def game_ov
    puts "\n---------------------------------------------"
    puts "                GAME OVER                      "
    if HumanPlayer.all[0].hp > 0
        puts "Congrats #{HumanPlayer.all[0].name}, you won !".colorize(92)
    else
        puts "Noob, you lost.".colorize(31)
    end
    puts "---------------------------------------------"
end