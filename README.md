# Pinwyn-Engine
A game engine for Computercraft

Features:
* Tilemaps
* Raytracing for tilemaps
* pixel-precise collision with tilemaps
* Sprites
* Buttons
* Event handler
* Buffer
* Error handler
* Game lifecyle manager

Here is a simple program:
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

while true do
  -- 0.06 is the delta time we want between frames
  engine.update(gameElements, 0.06,
    function()
      -- our custom update code
      -- quit when q is pressed
      if engine.keyboard.q then engine.quit() end
    end
  )
  engine.draw(gameElements)
end

```
Here is an example of raytracing:
[!alt-text](https://i.imgur.com/DlRCuUj.png "Example Game")
