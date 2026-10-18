Object = require("lib.classic.classic")
require"lib.requirehelper.recursiveEnumerate"
require"lib.requirehelper.requireFiles"
local Timer = require "lib.chrono.Timer"
vec = require"lib.hump.vector"

-- Esercizio 24, facciamo così
local function loopAnim() 
  timer:tween(0.2, circleForever,{radius = 10}, 'in-elastic', function() 
    timer:tween(0.2, circleForever, {radius = 50}, 'out-elastic', function() loopAnim() end) 
        end)
end

function love.load()
  local lista_file = {}
  recursiveEnumerate("obj",lista_file)
  requireFiles(lista_file)
  
  
  
  -- testPad = TestPad(200,200,30)
  
  
  cross = Cross(love.graphics.getWidth() / 4,100,100,30)
  circle = Circle(love.graphics.getWidth() / 4 * 2,100,24)
  hyper = HyperCircle:new(love.graphics.getWidth() / 4 * 3,100,15,3,19)
  health = HealthBar(love.graphics.getWidth() / 4 - 100 ,200,100)
  circleForever = Circle(love.graphics.getWidth() / 4 * 2,200,50)
  circleManual = Circle(love.graphics.getWidth() / 2 ,400,50)
  
  
  timer = Timer()
  
  -- Transizione hyper
  timer:tween(1,hyper,{outer_radius = 50},"in-out-elastic", function()
      timer:tween(1.2,hyper,{outer_radius = 25},"out-elastic") 
    end)
  
    timer:tween(1,hyper,{outer_radius = 50},"in-out-elastic")
  
  -- Transizione Circle
  timer:after(2, function()
        timer:tween(3, circle, {radius = 96}, 'in-out-cubic', function()
            timer:tween(0.1, circle, {radius = 4}, 'in-out-cubic')
        end)
    end)
  
  -- Esercizio 24, Transizione continua
  loopAnim()

  
    --Esercizio 22, la stramaledettissima croce
  timer:tween(1,cross.braccio1, {s = 0},"in-out-cubic", function()
      timer:tween(1,cross.braccio2, {s=0},"in-out-cubic", function()
          timer:tween(2,cross.braccio1, {s = 30}, "in-out-cubic")
          timer:tween(2,cross.braccio2, {s = 30}, "in-out-cubic")
        end)
      end) 
  
   -- Esercizio 21
  for i=1,10, 1 do
    timer:after(0.5 * i, function() print(math.random()) end)
  end
  
end

function love.update(dt)
  timer:update(dt)
 -- testPad:update(dt)   non so perché l'ho messo qua che mi inquina tutto
  end
  
function love.draw()
	circle:draw()
  hyper:draw()
  cross:draw()
  health:draw()
--  testPad:draw()
  circleForever:draw()
  circleManual:draw()
end


function love.keypressed(key)
  if key == "z" then
    timer:after(1, function() print("ehi") end,"z_key_press")   -- prova cancel timer con tag
   end
  if key == "d" then
    health:takeDamage(20)
  end
  if key == "escape" then
    love.event.quit()
  end
  if key == "kp+" then
    timer:cancel('contrai')
    timer:tween(0.1, circleManual, {radius = circleManual.radius + 10}, 'in-elastic','espandi')
  end
  if key == "kp-" then
    timer:cancel('espandi')
     if circleManual.radius >=10 then
      timer:tween(0.1, circleManual, {radius = circleManual.radius - 10}, 'in-elastic','contrai')
    end
  end
  
 end
 