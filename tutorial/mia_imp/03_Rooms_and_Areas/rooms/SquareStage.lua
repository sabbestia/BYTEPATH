local SquareStage = Object:extend()

function SquareStage:new()
  cx = love.graphics.getWidth() / 2
  cy = love.graphics.getHeight() / 2
  square = {}
  square.w = 40
  square.h = 40
  square.x = square.w / 2
  square.y = square.h / 2
end

function SquareStage:update(dt)
end

function SquareStage:draw()
   love.graphics.push("all")
  love.graphics.translate(cx,cy)
  love.graphics.rectangle("fill",- square.x,-square.y,square.w,square.h)
  love.graphics.pop()
end

return SquareStage
