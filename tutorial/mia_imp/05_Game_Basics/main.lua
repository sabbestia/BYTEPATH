Object = require "libs.classic.classic"
require "libs.utils.recursiveEnumerate"
require "libs.utils.requireFiles"
require("libs.utils.random_dec")
Input = require("libs.boipushy.Input")
Timer = require "libs.chrono.Timer"
M = require "libs.Moses.moses"
vec = require "libs.hump.vector"

GameObject = require "objs.GameObject" -- tocca chiamarlo esplicitamente qui
                                       -- per questioni di ordinamento alfabetico
--Stage = require "rooms.Stage"

function love.load()
  love.graphics.setDefaultFilter("nearest","nearest")
  love.graphics.setLineStyle("rough")
  resize(3)
  
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
  if     key == "f1" then gotoRoom("Stage")
  elseif key == "f2" then gotoRoom("SquareStage")
  elseif key == "f3" then gotoRoom("PolygonStage")
  elseif key == "f4" then gotoRoom("Stage48")
  elseif key == "f5" then gotoRoom("Stage49")
  elseif key == "f6" then gotoRoom("Stage59")
  elseif key == "f7" then gotoRoom("Stage60")
  elseif key == "f8" then gotoRoom("Stage61")
  elseif key == "escape" then love.event.quit()

  end
end

function resize(s)
  love.window.setMode(s*gw,s*gh)
  sx,sy = s,s
end

