local EnemyCircle = GameObject:extend()

function EnemyCircle:new(area,x,y,opts)
  EnemyCircle.super.new(self,area,x,y,opts)
  self.radius = love.math.random(10,30)
end

  
function EnemyCircle:update(dt)
  EnemyCircle.super.update(self,dt)
end

function EnemyCircle:draw()
  love.graphics.circle("fill",self.x, self.y,self.radius)
end

return EnemyCircle

