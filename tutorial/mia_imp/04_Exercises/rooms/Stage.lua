local Stage = Object:extend()

function Stage:new()
   self.area = Area()
  self.timer = Timer()
end

function Stage:update(dt)
  self.area:update(dt)
  self.timer:update(dt)
end

function Stage:draw()
    self.area:draw()
end

return Stage
