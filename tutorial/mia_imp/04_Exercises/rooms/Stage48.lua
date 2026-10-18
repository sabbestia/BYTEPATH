local Stage48 = Object:extend()

function Stage48:new()
  self.area = Area()
  self.timer = Timer()
  self.timer:every(2, function()
      self.area:addGameObject('Circle48', love.math.random(0,800), love.math.random(0,600), {radius = love.math.random(4,20)})end) 
  
end

function Stage48:update(dt)
  self.area:update(dt)
  self.timer:update(dt)
end

function Stage48:draw()
  self.area:draw()
end

return Stage48