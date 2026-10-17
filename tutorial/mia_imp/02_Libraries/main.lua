Object = require("lib.classic.classic")
require"lib.requirehelper.recursiveEnumerate"
require"lib.requirehelper.requireFiles"
local Timer = require "lib.hump.timer"
vec = require"lib.hump.vector"


function love.load()
  local lista_file = {}
  recursiveEnumerate("obj",lista_file)
  requireFiles(lista_file)
  
  
  cross = Cross(200,100,100,30)
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
  
  
   -- Esercizio 21
  for i=1,10, 1 do
    timer:after(0.5 * i, function() print(math.random()) end)
  end
  
  --Esercizio 22, la stramaledettissima croce
   --timer:tween(1,hyper,{outer_radius = 50},"in-out-elastic")
  timer:tween(1,cross.braccio1, {s = 0},"in-out-cubic", function()
      timer:tween(1,cross.braccio2, {s=0},"in-out-cubic", function()
          timer:tween(2,cross.braccio1, {s = 30}, "in-out-cubic")
          timer:tween(2,cross.braccio2, {s = 30}, "in-out-cubic")
        end)
      end)
    -- Si e vaffanculo
    
  
    
  
  
end

function love.update(dt)
  timer:update(dt)

  end
  
function love.draw()
	circle:draw()
  hyper:draw()
  cross:draw()
end


function love.keypressed(key)
  if key == "z" then
    if handle1 then
      timer:cancel(handle1)
    end  
     handle1 = timer:after(1, function() print("ehi") end)
   end
 end
 