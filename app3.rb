require 'bundler'
require 'etc'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/visuals'

#yes the app file is studip, so what ?

def perform
    my_game = Game.new("Supername")
end

perform