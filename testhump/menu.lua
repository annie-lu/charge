Gamestate = require 'hump.gamestate'
local Game = require 'game'
local Ithinkigotthis = require 'ithinkigotthis'
local Menu = {}

function Menu:draw()
    love.graphics.print("Press Enter to continue", 10, 10)
end

function Menu:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Game)
    else
        Gamestate.switch(Ithinkigotthis)
    end
end

return Menu
