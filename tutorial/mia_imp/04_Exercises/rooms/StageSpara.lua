local StageSpara = Stage:extend()

function StageSpara:new()
  StageSpara.super:new()
  love.mouse.setVisible(false)
  
  self.input = Input()
  self.input:bind('d',"destroy_rectangle")
  self.input:bind('mouse1',"spara")
  self.pointer = self.area:addGameObject("Pointer",0,0, {class="Pointer"})
  
  for i =1,10 do
    self.area:addGameObject("EnemyCircle",
      random_dec(0,800),
      random_dec(0,610),
      {class = "Enemy"}
      )
  end
end


function StageSpara:update(dt)
  StageSpara.super:update(dt)
  
  if M.count(self:listaNemici()) == 0 then
       for i =1,10 do
        self.area:addGameObject("EnemyCircle",
          random_dec(0,800),
          random_dec(0,610),
          {class = "Enemy"}
        )
      end
  end
  
  for _,enemy in ipairs(self:listaNemici()) do
    dir_x = love.math.random(0,2) - 1
    dir_y = love.math.random(0,2) - 1
      enemy.x = enemy.x + 80 * dir_x * dt
      if enemy.x + enemy.radius > love.graphics.getWidth() then
        enemy.x = love.graphics.getWidth() - enemy.radius
      elseif enemy.x - enemy.radius < 0 then
        enemy.x = 0 + enemy.radius
      end
      enemy.y = enemy.y + 80 * dir_y * dt
      if enemy.y + enemy.radius > love.graphics.getHeight() then
        enemy.y = love.graphics.getHeight() - enemy.radius
      elseif enemy.y - enemy.radius < 0 then
        enemy.y = 0 + enemy.radius
      end
  end
  
  if self.input:pressed("spara") then
    self.pointer:spara()
    local sparati = {}
    print("bang")
    mx,my = love.mouse.getPosition()
    sparati = self.area:queryCircleArea(mx,my,50,{"Enemy", "Civilian"})
    
    if #sparati > 0 then         
      for i=#sparati, 1, -1 do
        print('ahia!')
        for j=#self.area.game_objects, 1, -1 do    --Scorri la lista degli oggetti
          if self.area.game_objects[j].id == sparati[i].id and 
          self.area.game_objects[j].class == "Enemy" then        
            self.area.game_objects[j]:muori()
            goto continue
          end
        end
        ::continue::
      end
    end
  end

  if self.input:pressed("destroy_rectangle") then
        self.area.game_objects[love.math.random(#self.area.game_objects)].dead = true
  end
end  -- Fine update


function StageSpara:draw()
  StageSpara.super:draw()
end

function StageSpara:listaNemici()
  return M.filter(self.area.game_objects, function(v) return   v.class == "Enemy" end)
end
  

return StageSpara