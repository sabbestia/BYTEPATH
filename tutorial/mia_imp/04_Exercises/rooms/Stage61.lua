local Stage61 = Stage:extend()

function Stage61:new()
  self.area = Area()
  self.timer = Timer()
  
  self.input = Input()
  self.input:bind('d',"destroy_rectangle")
  self.input:bind('mouse1',"spara")
  
  for i =1,10 do
    self.area:addGameObject("Circle60",
      random_dec(0,800),
      random_dec(0,610),
      {class = "Enemy"}
      )
      --self.area.game_objects[love.math.random(#self.area.game_objects)].dead = false)
  end
  
  
end

function Stage61:update(dt)
  self.area:update(dt)
  self.timer:update(dt)
  
  if self.input:pressed("spara") then
    local sparati = {}
    print("bang")
    mx,my = love.mouse.getPosition()
    sparati = self.area:queryCircleArea(mx,my,50,{"Enemy", "Civilian"})
    
    if #sparati > 0 then          --Se sparati non è zero
      for i=#sparati, 1, -1 do     -- Per ogni sparato
        print('ahia!')
        for j=#self.area.game_objects, 1, -1 do    --Scorri la lista degli oggetti
          if self.area.game_objects[j].id == sparati[i].id then         -- E se l'id corrisponde
            table.remove(self.area.game_objects,j)   -- Distrugilo
            goto continue
          end
        end
        ::continue::
      end
    end
  end

  if self.input:pressed("destroy_rectangle") then
       --self.area.game_objects[love.math.random(#self.area.game_objects)].dead = true
        table.remove(self.area.game_objects,love.math.random(#self.area.game_objects))
    if #self.area.game_objects == 0 then
      for i =1,10 do
        self.area:addGameObject("Circle60",random_dec(0,800),random_dec(0,610))
      end
    end
  end
  
end  -- Fine update


function Stage61:draw()
  self.area:draw()
end

return Stage61