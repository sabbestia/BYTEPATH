Object = require("lib.classic.classic")
require"lib.requirehelper.recursiveEnumerate"
require"lib.requirehelper.requireFiles"
local Timer = require "lib.hump.timer"


function love.load()
  local lista_file = {}
  recursiveEnumerate("obj",lista_file)
  requireFiles(lista_file)
  circle = Circle(50,50,24)
  hyper = HyperCircle:new(400,300,15,3,19)
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