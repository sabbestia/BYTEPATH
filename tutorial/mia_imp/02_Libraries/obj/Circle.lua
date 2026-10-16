local Circle = Object:extend()

function Circle:new(x,y,radius)
  self.pos = vec(x or 0,y or 0)
    self.radius = radius or 10
    self.creation_time = love.timer.getTime()
    return self
end


function Circle:draw()
  love.graphics.circle("fill",self.pos.x,self.pos.y,self.radius)
end

return Circle