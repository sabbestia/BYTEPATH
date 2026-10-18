Object = require "libs.classic.classic"
require "libs.utils.recursiveEnumerate"
require "libs.utils.requireFiles"
Timer = require "libs.chrono.Timer"
M = require "libs.Moses.moses"
GameObject = require "objs.GameObject" -- tocca chiamarlo esplicitamente qui
                                       -- per questioni di ordinamento alfabetico

function love.load()
  
---Caricamento assets
  local lista_room = {}
  local lista_obj = {}
  recursiveEnumerate("rooms",lista_room)
  requireFiles(lista_room)
  recursiveEnumerate("objs",lista_obj)
  requireFiles(lista_obj)
  
  current_room = nil
  
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
  if key == "f1" then
    gotoRoom("CircleStage")
  elseif key == "f2" then
    gotoRoom("SquareStage")
  elseif key == "f3" then
    gotoRoom("PolygonStage")
  elseif key == "f4" then
    gotoRoom("Stage48")
  elseif key == "f5" then
    gotoRoom("Stage49")
  end
end
