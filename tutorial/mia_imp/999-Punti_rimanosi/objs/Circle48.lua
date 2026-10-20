local Circle48 = GameObject:extend()

function Circle48:new(area,x,y,opts)
  Circle48.super.new(self,area,x,y,opts)
  self.timer:after(love.math.random() * (4-2) + 2, function() self.dead = true end)
end

  
function Circle48:update(dt)
  Circle48.super.update(self,dt)
end

function Circle48:draw()
  love.graphics.circle("fill",self.x, self.y, self.radius or 4)
end

return Circle48

