local Stage49 = Object:extend()

function Stage49:new()
  self.game_objects = {}
  self.timer = Timer()
  self.timer:every(2, function()
      self:addGameObject('Circle49', love.math.random(0,800), love.math.random(0,600), {radius = love.math.random(4,20)})end) 
  
end

function Stage49:update(dt)
  self.timer:update(dt)
   for i= #self.game_objects, 1, -1 do
    local game_object = self.game_objects[i]
    game_object:update(dt)
    if game_object.dead == true then table.remove(self.game_objects, i) end
  end
end

function Stage49:draw()
    for _, game_object in ipairs(self.game_objects) do game_object:draw() end
end

function Stage49:addGameObject(game_object_type,x,y,opts)
  local opts = opts or {}
  local game_object = _G[game_object_type](x or 0, y or 0, opts)
  table.insert(self.game_objects, game_object)
  return game_object
end

return Stage49