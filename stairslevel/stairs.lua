Gamestate = require 'hump.gamestate'

local Stairs = {}

local Player = require 'playerTest'

local rect = HC.rectangle(200, 500, 400, 20)
local rect2 = HC.rectangle(100, 700, love.graphics.getWidth(), 20)
local lol = Player(300, 150, true, true, 800)
local text = ""
local test = {}
function Stairs:update(dt)

    lol:update(dt)

    lol:addPlatform(rect)
    lol:addPlatform(rect2)

    -- if lol:getBotBB():collidesWith(rect) then
    --     text = "BOO"
    -- end
end

function Stairs:draw(dt)


    love.graphics.print("" .. text, 400, 400)
    rect:draw(dt)
    rect2:draw(dt)
    lol:draw(dt)

end

return Stairs
