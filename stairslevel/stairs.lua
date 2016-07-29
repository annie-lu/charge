Gamestate = require 'hump.gamestate'
Piano = require 'pianolevel.piano'

local Stairs = {}

local Player = require 'playerTest'

local rect = HC.rectangle(200, 500, 400, 20)
local rect2 = HC.rectangle(100, 700, love.graphics.getWidth(), 20)
local lol = Player(300, 150, true, true, 800)
local text = ""

lol:addPlatform(rect2)
lol:addPlatform(rect)


--local test = {}
function Stairs:update(dt)

    lol:update(dt)




    -- if lol:getBotBB():collidesWith(rect) then
    --     text = "BOO"
    -- end
end

function Stairs:draw(dt)


    love.graphics.print("" .. text, 400, 400)

        love.graphics.print("press enter to continue")

    rect:draw(dt)
    rect2:draw(dt)
    lol:draw(dt)

end

function Stairs:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Piano)
    end
end

return Stairs
