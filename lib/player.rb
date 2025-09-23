class Player
    attr_accessor :name, :hp
    @@players = []

    def is_alive
        if @hp > 0
            return true
        else
            return false
        end
    end

    def initialize(name)
        @name = name
        @hp = 10
        @@players << self
    end

    def self.all
        @@players
    end

    def show_player_state
        if is_alive
            puts "#{name} has #{hp} HP."
        else
            puts "#{name} is dead."
        end
    end

    def compute_dmg
        rand(1..10)
    end

    def attacks(ennemy)
        if ennemy.is_alive #check before fighting if ennemy is alive
            puts "\n#{name} attacks #{ennemy.name}"
            ennemy.gets_damage(compute_dmg)
        else
            puts "#{ennemy.name} is already dead !"
        end
    end

    def gets_damage(dmg)
        puts "#{name} takes #{dmg} damage"
        @hp -= dmg
        if is_alive == false
            puts "#{name} est mort."
            return
        else
            show_player_state
        end
    end
end

class HumanPlayer < Player
    
    attr_accessor :name, :hp, :weapon_lvl
    @@HumanPlayers = []

    def initialize(name)
        @name = name
        @weapon_lvl = 1
        @hp = 100
        @@HumanPlayers << self
    end

    def show_player_state
        puts "#{name} has #{hp} HP and a lvl #{weapon_lvl} weapon."
    end

    def compute_dmg
        (rand(1..10) * @weapon_lvl)
    end

    def self.all
        @@HumanPlayers
    end

    def search_wpn
        dice = rand(1..6)
        puts "You found a level #{dice} weapon."
        if dice > weapon_lvl
            @weapon_lvl = dice
            puts "Weapon upgraded !"
        else
            puts "Your current weapon is better. No upgrades."
        end
    end

    def add_hp(added_hp)
            @hp += added_hp
            if @hp > 100
                @hp = 100
            end
            puts "#{added_hp} Health points restored."
            puts "You now have #{hp} HP."
    end

    def search_hp
        dice = rand(1..6)
        if dice > 1 && dice < 6
            add_hp(50)
        elsif dice == 6
            add_hp(80)
        elsif dice == 1
            puts "You didn't find HP."
        end
    end

end