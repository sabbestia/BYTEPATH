local Cross = Object:extend()

function Cross:new(x,y,l,s)
    self.centro = vec(x,y)
    self.l = l --lunghezza
    self.s = s  --spessore
    self.braccio1 = {
      mode = "fill",
      centro = self.centro,
      l = self.l,
      s = self.s
    }
    self.braccio2 = {
      mode = "fill",
      centro = self.centro,
      l = self.l,
      s = self.s
    }
    return self
    
    
end

function Cross:draw()
    love.graphics.push("all")
        love.graphics.translate(
            self.centro.x,
            self.centro.y
        )
        love.graphics.rectangle(
            "fill",
            - self.braccio1.s /2,
            - self.braccio1.l / 2,
            self.braccio1.s,
            self.braccio1.l)
       -- love.graphics.push("all")
            love.graphics.rotate(math.rad(90))
            love.graphics.rectangle(
                "fill",
                - self.braccio2.s /2,
                - self.braccio2.l / 2,
                self.braccio2.s,
                self.braccio2.l)
        --love.graphics.pop()
    love.graphics.pop()
end
return Cross



