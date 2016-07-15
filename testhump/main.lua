Gamestate = require 'hump.gamestate'

--[[
local menu = {} -- previously: Gamestate.new()
local game = {}
local ithinkigotthis = {}

function menu:draw()
    love.graphics.print("Press Enter to continue", 10, 10)
end

function menu:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(game)
    else
        Gamestate.switch(ithinkigotthis)
    end
end

function game:draw()
    love.graphics.print("bless")
end

function ithinkigotthis:draw()
  love.graphics.print("itworks :')")
end

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end
]] -- testing an alternative version

local Menu = require 'menu' -- previously: Gamestate.new()
local Game = require 'game'
local Ithinkigotthis = require 'ithinkigotthis'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Menu)
end
