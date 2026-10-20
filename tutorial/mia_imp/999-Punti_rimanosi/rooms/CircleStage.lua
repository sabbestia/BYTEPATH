local CircleStage = Object:extend()

function CircleStage:new()
  cx = love.graphics.getWidth() / 2
  cy = love.graphics.getHeight() / 2
  circle = {radius = 20}
end

function CircleStage:update(dt)
end

function CircleStage:draw()
  love.graphics.push("all")
  love.graphics.translate(cx,cy)
  love.graphics.circle("fill",0,0,circle.radius)
  love.graphics.pop()
end

return CircleStage
