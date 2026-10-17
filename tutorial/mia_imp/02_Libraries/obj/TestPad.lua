local TestPad = Object:extend()

function TestPad:new(x,y,radius)
  self.x = x
  self.y = y
  self.radius = radius
  joy = love.joystick.getJoysticks()
  return self
end

function TestPad:update(dt)
  local leftx_pos = joy:getGamepadAxis("leftx")
  local lefty_pos = joy:getGamepadAxis("lefty")
  
end


function TestPad:draw()
  love.graphics.circle("line",self.x,self.y,self.radius)
  love.graphics.push("all")
    love.graphics.translate(self.x,self.y)
   love.graphics.circle("fill", leftx_pos * radius, lefty_pos * radius,2)
  love.graphics.pop()
  
end

function love.joystickadded(joystick)
    p1joystick = joystick
end


return TestPad