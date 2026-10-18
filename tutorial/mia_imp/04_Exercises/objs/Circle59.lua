local Circle59 = GameObject:extend()

function Circle59:new(area,x,y,opts)
  Circle59.super.new(self,area,x,y,opts)
end

  
function Circle59:update(dt)
  Circle59.super.update(self,dt)
end

function Circle59:draw()
  love.graphics.circle("fill",self.x, self.y, self.radius or 4)
end

return Circle59

