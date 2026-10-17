local HealthBar = Object:extend()

function HealthBar:new(x,y,hp)
self.x = x
self.y = y
self.hp = hp
self.fg = {
  color = {1,0,0},
  w = hp
}
self.bg = {
  color = {0.8,0,0.2},
  w = hp
  }
end


function HealthBar:update(dt)
end

function HealthBar:draw()
love.graphics.push("all")
  love.graphics.setColor(self.bg.color)
  love.graphics.rectangle("fill",self.x,self.y,self.bg.w, 10)  --back
  love.graphics.setColor(self.fg.color)
  love.graphics.rectangle("fill",self.x,self.y,self.fg.w, 10)  --fore
  love.graphics.pop()
end

function HealthBar:takeDamage(dmg)
   timer:tween(
       0.5,
       self.fg, 
       {w = self.fg.w - 20},
       "in-out-cubic",
       'dmg-fg-tween'
     )
     
     if handledmg_bg then timer:cancel(handledmg_bg) end 
    timer:after(0.25, 
      function() timer:tween(0.5, self.bg,{w = self.bg.w - 20},"in-out-cubic",'dmg-bg-tween') end, function() handledmg_bg = nil end,'dmg-after')

end
return HealthBar