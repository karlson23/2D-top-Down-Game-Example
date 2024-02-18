world:add(Player, Player.x ,Player.y,Player.width,Player.height)

-- Collision detection function;
-- Returns true if two boxes overlap, false if they don't;
-- x1,y1 are the top-left coords of the first box, while w1,h1 are its width and height;
-- x2,y2,w2 & h2 are the same, but for the second box.
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end



walls = {}

function PlayerWallCollision(dt)
  if mainRoom.MainCharRoom.layers['Walls'] then
    for i,obj in ipairs(mainRoom.MainCharRoom.layers['Walls'].objects) do
      local wall = {obj.x,obj.y,obj.width,obj.height}
      table.insert(walls,wall)
      world:add(wall,obj.x,obj.y,obj.width,obj.height)
      if CheckCollision(obj.x,obj.y,obj.width,obj.height,Player.x,Player.y,Player.width,Player.height) then
    end
  end
  end
end


