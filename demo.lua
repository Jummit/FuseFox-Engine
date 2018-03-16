os.loadAPI("engine")

elements = {
  player = engine.elements.sprite({
    path = "player.nfp",
    x = 10, y = 10,
    moves = {
      up =  {0, -1},
      down= {0,  1},
      left= {-1, 0},
      right={1,  0}
    },
    update = function(self)
      for key, move in pairs(self.moves) do
        if engine.keyboard[key] then
          self:moveTo(elements.tilemap, move[1], move[2])
        end
      end
      elements.tilemap.lightSource.x = self.x
      elements.tilemap.lightSource.y = self.y
    end
  }),
  tilemap = engine.elements.tilemap({
    dynamicLight = true,
    lightSource = {x=3, y=3},
    tileset = {
      floor = {bc=colors.green,tc=colors.gray,char=" "},
      grass = {bc=colors.green,tc=colors.lime,char="\""},
      wall = {bc=colors.gray,tc=colors.lightGray,char=" ",solid=true}
    },
    generate = function(self)
      elements.tilemap:setRectangle(1, 1, engine.width, engine.height, "floor")
      for x = 1, #self do
        for y = 1, #self[x] do
          if math.random(1, 10) == 1 then
            self:setTile(x, y, "grass")
          end
        end
      end
      for i = 1, 10 do
        elements.tilemap:setRectangle(math.random(1, engine.width-4), math.random(1, engine.height-3), 3, 2, "wall")
      end
    end
  })
}

while not exit do
  engine.update(elements, 0.06, function()
    if engine.keyboard.q then exit = true end
  end)
  engine.draw(elements)
end
engine.quit()
