local Cross = Object:extend()

function Cross:new()
    self centro = vec(x,y)
    self l = l --lunghezzq
    self s = s  --spessore
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
            self.centro.x - (self.s /2,
            self.centro.y,
            self.s))
        love.graphics.push("all")
            love.graphics.rotate(math.rad(90))
            love.graphics.rectangle(
                "fill",
                self.centro.x - (self.s /2,
                self.centro.y,
                self.s))
        love.graphics.pop()
    love.graphics.pop()
end



