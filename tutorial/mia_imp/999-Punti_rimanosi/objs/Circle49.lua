local Circle49 = Object:extend()

function Circle49:new(x,y,opts)
  local opts = opts or {}
  if opts then for k,v in pairs(opts) do self[k] = v end end
  
  self.x = x
  self.y = y
  self.id = M.uid()
  self.dead = false
  self.timer = Timer()
  self.timer:after(love.math.random() * (4-2) + 2, function() self.dead = true end)
  
end

function Circle49:update(dt)
  if self.timer then self.timer:update(dt) end
end

function Circle49:draw()
  love.graphics.circle("fill",self.x,self.y,self.radius or 2)
  
end

return Circle49
