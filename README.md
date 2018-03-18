# Pinwyn-Engine
A game engine for Computercraft

Features:
* Tilemaps
* Raytracing for tilemaps
* Save and load feature for tilemaps
* Pixel-precise collision with tilemaps
* Sprites
* Buttons
* Event handler
* Buffer
* Error handler
* Game lifecycle manager
* A big and usefull wiki

## [Check out the wiki to get started!](https://github.com/Jummit/Pinwyn-Engine/wiki)

## Here is a simple program:
``` lua
-- Load the engine
os.loadAPI("engine")

gameElements = {
  -- create a new sprite element
  player = engine.elements.sprite({
    path = "player.nfp", -- the path to the sprite
    x = 10, y = 10,
    update = function(self)
      -- player movement
      if engine.keyboard.up then
        self.y = self.y + -1
      elseif engine.keyboard.down then
        self.y = self.y + 1
      elseif engine.keyboard.left then
        self.x = self.x -1
      elseif engine.keyboard.right then
        self.x = self.x + 1
      end
    end
  })
}

-- start the game!
engine.run(
  elements,
  0.06, -- delta time (time between frames)
  function()
    -- our custom update code
    -- quit when q is pressed
    if engine.keyboard.q then engine.quit() end
  end
)
```
## Here is the demo game in action:
![alt-text](https://i.imgur.com/1kixxsB.png "Demo Game")
## Here is an example of raytracing:
![alt-text](https://i.imgur.com/DlRCuUj.png "Raytracing Game")
