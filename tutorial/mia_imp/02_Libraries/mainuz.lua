function love.load()
  items = love.filesystem.getDirectoryItems("obj")
end
function love.draw()
  local y = 0
  for _,item in ipairs(items) do
    info = love.filesystem.getInfo(item)
  love.graphics.print(info.type,0,y)
  y =  y + 10
  end
end

  