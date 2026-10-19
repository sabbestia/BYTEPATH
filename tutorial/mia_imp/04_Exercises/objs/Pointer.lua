local Pointer = GameObject:extend()

function Pointer:new(area,x,y,opts)
  Pointer.super.new(self,area,x,y,opts)
  self.pos = vec(self.x,self.y)
  self.radius = 4
end

  
function Pointer:update(dt)
  Pointer.super.update(self,dt)
  mx,my = love.mouse.getPosition()
  self.pos.x,self.pos.y = mx,my

end

function Pointer:draw()
  love.graphics.push("all")
  love.graphics.setColor(1,0,0)
  love.graphics.circle("fill",self.pos.x, self.pos.y, self.radius or 4)
  love.graphics.pop()
end

function Pointer:spara()
  self.timer:tween(0.02,self,{radius = 50},'in-quint',function()
      self.timer:tween(0.05, self, {radius = 4}, 'out-linear') end)
end


return Pointer

