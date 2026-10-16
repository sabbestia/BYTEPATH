local HyperCircle = Circle:extend()

function HyperCircle:new(x,y,radius,line_width,outer_radius)
  HyperCircle.super:new(x,y,radius)
  self.line_width = line_width or 1
  self.outer_radius = outer_radius or self.radius + 10
  return self
end


function HyperCircle:draw()
  HyperCircle.super:draw()
  love.graphics.setLineWidth(self.line_width)
  love.graphics.circle("line",self.pos.x,self.pos.y,self.outer_radius)
end

return HyperCircle