local Circle60 = GameObject:extend()

function Circle60:new(area,x,y,opts)
  Circle60.super.new(self,area,x,y,opts)
  self.radius = love.math.random(10,30)
end

  
function Circle60:update(dt)
  Circle60.super.update(self,dt)
end

function Circle60:draw()
  love.graphics.circle("fill",self.x, self.y,self.radius)
end

return Circle60

