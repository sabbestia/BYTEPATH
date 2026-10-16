Object = require("lib.classic.classic")
require"lib.requirehelper.recursiveEnumerate"
require"lib.requirehelper.requireFiles"
local Timer = require "lib.hump.timer"
vec = require"lib.hump.vector"

local rect1 = {
  pos = vec(200,200),
  w = 200,
  h =50
}
local rect2 = {
  pos = vec(rect1.pos.x + rect1.w / 2 - 25,rect1.pos.y - rect1.h / 2 -50),
  w = 50,
  h =200
  }


function love.load()
  local lista_file = {}
  recursiveEnumerate("obj",lista_file)
  requireFiles(lista_file)
  circle = Circle(50,50,24)
  hyper = HyperCircle:new(0,0,15,3,19)
  timer = Timer()
  timer:tween(1,hyper,{outer_radius = 50},"in-out-elastic", function()
      timer:tween(1.2,hyper,{outer_radius = 25},"out-elastic") 
    end)
  timer:after(2, function()
        timer:tween(3, circle, {radius = 96}, 'in-out-cubic', function()
            timer:tween(0.1, circle, {radius = 4}, 'in-out-cubic')
        end)
    end)
end

function love.update(dt)
  timer:update(dt)

  end
  
function love.draw()
	circle:draw()
  hyper:draw()
  love.graphics.rectangle("fill",rect1.pos.x,rect1.pos.y,rect1.w,rect1.h)
  love.graphics.rectangle("fill",rect2.pos.x,rect2.pos.y,rect2.w,rect2.h)
end


--[[
function recursiveEnumerate(folder, file_list)
	local items = love.filesystem.getDirectoryItems(folder)
	for _,item in ipairs(items) do
		local file = folder .. "/" .. item
		local info = love.filesystem.getInfo(file)
		if info then
			if info.type == "file" then
				table.insert(file_list, file)
			elseif info.type == "directory" then
				recursiveEnumerate(file, file_list)
			end
		end
	end
end



function requireFiles(files)
	for _,filepath in ipairs(files) do
		local filepath = filepath:sub(1,-5)
		local parts = split(filepath,"/")
		local class = parts[#parts]
		_G[class] = require(filepath)
	end
end

]]--