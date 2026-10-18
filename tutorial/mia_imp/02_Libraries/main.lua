Object = require("lib.classic.classic")
require"lib.requirehelper.recursiveEnumerate"
require"lib.requirehelper.requireFiles"
local Timer = require "lib.chrono.Timer"
vec = require"lib.hump.vector"
M = require "lib.moses.moses"

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
  
a = {1, 2, '3', 4, '5', 6, 7, true, 9, 10, 11, a = 1, b = 2, c = 3, {1, 2, 3}}
b = {1, 1, 3, 4, 5, 6, 7, false}
c = {'1', '2', '3', 4, 5, 6}
d = {1, 4, 3, 4, 5, 6}
e = {1,2,3,4}
  
  
  
  -- testPad = TestPad(200,200,30)
  
  
  cross = Cross(love.graphics.getWidth() / 4,100,100,30)
  circle = Circle(love.graphics.getWidth() / 4 * 2,100,24)
  hyper = HyperCircle:new(love.graphics.getWidth() / 4 * 3,200,10,50,19)
  health = HealthBar(love.graphics.getWidth() / 4 - 100 ,200,100)
  circleForever = Circle(love.graphics.getWidth() / 4 * 2,200,50)
  circleManual = Circle(love.graphics.getWidth() / 2 ,400,50)
  
  
  orb = Orbit(love.graphics.getWidth() / 4 * 3, --x
    400,  --y
    10,   --r
    5,    --line_w
    50,   --out_r
    5,    --planet_radius
    3,   --v_rot
    20,    --amplitude,
    8     --frequency
    
    )
  
  
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
 
 --[[
 for i=1,10, 1 do
    timer:after(0.5 * i, function() print(math.random()) end)
  end
  ]]--
  
  
  -- ======= ESERCIZI TABELLE ===========
  -- 28
  print("-----esercizio 28------")
  M.each(a, print)
  
  print("-----esercizio 29------")
  print(M.count(b,1))
  
  print("-----esercizio 30------")
  print("prima")
  M.each(d, print)
  d = M.map(d, function(_,v) return v + 1 end)
  print("dopo")
  M.each(d, print)
  
  print("-----esercizio 31------")
  print("prima")
  M.each(a,print)
  
  a = M.map(a, 
    function(_,v)
      if type(v) == "number" then return v*2 
      elseif type(v) == "string" then return v .. "xD"
      elseif type(v) == "boolean" then return not v
      elseif type(v) == "table" then end
  end)
  print("dopo")
  M.each(a,print)

  print("-----esercizio 32------")
  print(M.reduce(d, function(memo, v) return memo+v end))
  
  print("-----esercizio 33------")
  if M.include(a,12) then
    print("Si, è lì un 12")
  else
    print("boh...")
  end
  
  print("-----esercizio 34------")
  if M.detect(c,7) then
    print("Indice n." .. M.detect(c,7))
  end
  if M.detect(c,5) then
    print("Indice n." .. M.detect(c,5))
  end
  
  print("-----esercizio 35------")
  d = {1, 4, 3, 4, 5, 2}
  M.each(M.filter(d, function(_,v) return v > 3 end),print)
    
  print("-----esercizio 36------")
  M.each(M.filter(c, function(_,v) return type(v) == "string" end), print)
  
  
  print("-----esercizio 37------")
  print(M.all(c, function(_,v) return type(v) == "number" end))
  print(M.all(d, function(_,v) return type(v) == "number" end))
  
  print("-----esercizio 38------")
  d = {1, 4, 3, 4, 5, 2}
  M.each(M.shuffle(d),print)
  
  print("-----esercizio 39------")
  f = {1, 4, 3, 4, 5, 2}
  M.each(M.reverse(f),print)
   
  print("-----esercizio 40------")
  d = {1, 4, 3, 4, 5, 2}
  M.each(M.remove(d,1,4),print)
  
  print("-----esercizio 41------")
  a = {1, 2, '3', 4, '5', 6, 7, true, 9, 10, 11, a = 1, b = 2, c = 3, {1, 2, 3}}
  b = {1, 1, 3, 4, 5, 6, 7, false}
  c = {'1', '2', '3', 4, 5, 6}
  M.each(M.union(a,b,c),print)
  
  print("-----esercizio 42------")
  b = {1, 3, 4, 5, 6, 7, false}
  d = {1, 4, 3, 4, 5, 2}
  M.each(M.intersection(b,d),print)
  
  print("-----esercizio 43------")
  b = {1, 1, 3, 4, 5, 6, 7, false}
  d = {1, 4, 3, 4, 5, 2}
  M.each(M.append(b,d),print)
  
  
  
  
  


end

function love.update(dt)
  timer:update(dt)
 -- testPad:update(dt)   non so perché l'ho messo qua che mi inquina tutto
 orb:update(dt)
  end
  
function love.draw()
	circle:draw()
  hyper:draw()
  cross:draw()
  health:draw()
--  testPad:draw()
  circleForever:draw()
  circleManual:draw()
  orb:draw()
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
 