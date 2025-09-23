# bloody_ruby_OOPs

```
...... .......  ......... .......... .......... . ..
....@@@@@%........ .......  .. .......@@@@@@@@@.....
...@=::..+@@@@@@@@@@@@-...#@@@@@@@@@@#:.:+++#%%.....
 ..@%#++*%##-.. .......%@@:.......=*@@@*=-==@...... 
. ...@%#@=.@%@@++-%%@@@+%#@@@@++#@#@....@.@@........
.....=:.=.......@@+  .. @... ..@ ..@ .. @...... ....
.... .@-*..@=..... .....*.  ...@....@ .-@.@.........
 ...... @...%@..@...... -......* ..+@. = .... ......
.........@%:@ .. @@....@@.:..:=@....@%@@........... 
..........@+@........ ...... .... ..@@-..... .......
. . .... .. .... .................. ... ............
.............  .. ...... ...... .. .@.......... ... 
```
(These are vampire teeth... It's meant to be scary.)

## Project description

This project is about learning to use objects in ruby while crating a small fighting RPG.

There are 3 different programs :

### app.rb

automatically simulates a fight between two bots until one of them dies.

### app2.rb

This one is based on the above one, but features are introduced
- Adds a new category of player : HumanPlayer
- Allows the user to fight bots through strategic inputs
- allows user to define the number of ennemies
- The user can either
    - heal
    - fight
    - upgrade weapon
- The combat continues until either the player or all of the ennemies die.

#### Speedrun

You can **spam enter** to make the program play by itself.
- Number of ennemies will be set between 1 and 6
- Username will be systems username
- The living ennemies will be attacked randomly

### app3.rb

This one is like the 2nd with some improvements :
- All the game code in refactored in the Game class
- New ennemies (creeps) and Bosses may appear !
- New welcome screen !

The game is still not balanced and will probably not be. It's programmed to be hard as is !

# Visual

![Image](img/visual.png)

Image is taken from app2.rb

# Compatibility

This program is made to run appropriately on linux systems

# Credits

This program is done within the cursus of The Hacking Project
The ascii is generated from the image https://www.youtube.com/watch?v=XxoOGyGJgUM