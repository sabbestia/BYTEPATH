Object = require "libs.classic.classic"
GameObject = require "objs.GameObject" -- tocca chiamarlo esplicitamente qui
                                       -- per questioni di ordinamento alfabetico
                                       
sti = require "sti"
require "libs.utils.recursiveEnumerate"
require "libs.utils.requireFiles"
require("libs.utils.random_dec")
Input = require("libs.boipushy.Input")
Timer = require "libs.chrono.Timer"
M = require "libs.Moses.moses"
vec = require "libs.hump.vector"


--Stage = require "roomss.Stage"

function love.load()
  
---Caricamento assets
  local rooms = {}
  local lista_obj = {}
  current_room = nil
  
  recursiveEnumerate("rooms",rooms)
  requireFiles(rooms)
  recursiveEnumerate("objs",lista_obj)
  requireFiles(lista_obj)

  
  function addRoom(room_type, room_name, ...)
    local room = _G[room_type](room_name, ...)
    rooms[room_name] = room
    return room
end

function gotoRoom(room_type, room_name, ...)
    if current_room and rooms[room_name] then
        if current_room.deactivate then current_room:deactivate() end
        current_room = rooms[room_name]
        if current_room.activate then current_room:activate() end
    else current_room = addRoom(room_type, room_name, ...) end
end
  
end

function love.update(dt)
  if current_room then current_room:update(dt) end
end

function love.draw()
  if current_room then current_room:draw() end
end



function love.keypressed(key)
  if     key == "f1" then gotoRoom("CircleStage","StageOC")
  elseif key == "f2" then gotoRoom("SquareStage","StageU")
  elseif key == "f3" then gotoRoom("PolygonStage")
  elseif key == "f4" then gotoRoom("Stage48")
  elseif key == "f5" then gotoRoom("Stage49")
  elseif key == "f6" then gotoRoom("Stage59")
  elseif key == "f7" then gotoRoom("Stage60")
elseif key == "f8" then gotoRoom("Stage61","Staggg")
  elseif key == "f9" then gotoRoom("StageDuro1","StageDuro1")

  end
end
