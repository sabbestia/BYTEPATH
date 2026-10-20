local StageDuro1 = Stage:extend()

function StageDuro1:new()
  self.area = Area()
  self.timer = Timer()
  self.input = Input()
  self.input:bind('d',"destroy_rectangle")
  self.map = sti("mappa1.lua")
end

function StageDuro1:update(dt)
  self.area:update(dt)
  self.timer:update(dt)
  if self.input:pressed("destroy_rectangle") then
       --self.area.game_objects[love.math.random(#self.area.game_objects)].dead = true
        table.remove(self.area.game_objects,love.math.random(#self.area.game_objects))
    if #self.area.game_objects == 0 then
      for i =1,10 do
        self.area:addGameObject("Circle60",random_dec(0,800),random_dec(0,600))
      end
    end
  end
  self.map:update(dt)
end


function StageDuro1:draw()
  self.area:draw()
  self.map:draw()
end

return StageDuro1