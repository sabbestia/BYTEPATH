local PolygonStage = Object:extend()

function PolygonStage:new()
  cx = love.graphics.getWidth() / 2
  cy = love.graphics.getHeight() / 2
  points = {0,0,0,5,10,5,12,20}
end

function PolygonStage:update(dt)
end

function PolygonStage:draw()
  love.graphics.push("all")
  love.graphics.translate(cx,cy)
  love.graphics.polygon("fill",points)
  love.graphics.pop()
end

return PolygonStage
