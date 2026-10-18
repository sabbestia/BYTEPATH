Object = require "libs.classic.classic"
require "libs.utils.recursiveEnumerate"
require "libs.utils.requireFiles"
require("libs.utils.random_dec")
Input = require("libs.boipushy.Input")
Timer = require "libs.chrono.Timer"
M = require "libs.Moses.moses"

GameObject = require "objs.GameObject" -- tocca chiamarlo esplicitamente qui
                                       -- per questioni di ordinamento alfabetico
--Stage = require "rooms.Stage"

function love.load()
  
---Caricamento assets
  local lista_room = {}
  local lista_obj = {}
  recursiveEnumerate("rooms",lista_room)
  requireFiles(lista_room)
  recursiveEnumerate("objs",lista_obj)
  requireFiles(lista_obj)
  
  current_room = nil
  
  ---Esercizio 54
  print("Esercizio 54")
  local function printAll(...)
    args = {...}
    for i,v in ipairs(args) do
      print(v)
    end
  end
  printAll(1,2,3)
  
  ---Esercizio 55
  print("Esercizio 55")
  local function printText(...)
    local parts = {...}
    local result = ""
    for _,v in ipairs(parts) do
      result = result .. v
    end
    return result
  end
  print(printText('Ehi, ','ciao, ', 'burp! ','Come ', 'va','?'))
    
  
end

function love.update(dt)
  if current_room then current_room:update(dt) end
end

function love.draw()
  if current_room then current_room:draw() end
end

function gotoRoom(room_type, ...)
  current_room = _G[room_type] (...)
end

function love.keypressed(key)
  if     key == "f1" then gotoRoom("CircleStage")
  elseif key == "f2" then gotoRoom("SquareStage")
  elseif key == "f3" then gotoRoom("PolygonStage")
  elseif key == "f4" then gotoRoom("Stage48")
  elseif key == "f5" then gotoRoom("Stage49")
  elseif key == "f6" then gotoRoom("Stage59")
  elseif key == "f7" then gotoRoom("Stage60")

  end
end
