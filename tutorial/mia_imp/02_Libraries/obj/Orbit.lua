local Orbit = HyperCircle:extend()

function Orbit:new(x,y,radius,line_width,outer_radius,planet_radius,v_rot,amplitude,frequency)
  Orbit.super:new(x,y,radius,line_width,outer_radius)
  self.planet_radius = planet_radius or 5
  self.asse_rotazione = vec(0,self.outer_radius)
  self.origine_orbita = self.asse_rotazione
  self.v_rot = v_rot or 10
  self.amplitude = amplitude or 5
  self.frequency = frequency or 10
  return self
end

function Orbit:update(dt)
  time = love.timer.getTime()
  self.asse_rotazione = self.asse_rotazione:rotated(self.v_rot*dt)
  theta = self.asse_rotazione:angleTo(self.origine_orbita)
  self.pos_planet = self.asse_rotazione + (self.asse_rotazione * (self.amplitude * math.sin(theta * self.frequency + time))/100)
  
  end


function Orbit:draw()
  Orbit.super:draw()
  love.graphics.push("all")
    love.graphics.translate(self.pos.x,self.pos.y)
    love.graphics.circle("fill",self.pos_planet.x,self.pos_planet.y, self.planet_radius)
  love.graphics.pop()
end

return Orbit