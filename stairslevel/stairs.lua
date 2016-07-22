Gamestate = require 'hump.gamestate'

local Stairs = {}

local Player = require 'player'

local lol = Player(100, 350, true, true)

local rect = HC.rectangle(200, 200, 400, 20)

function Stairs:update(dt)

    lol:update(dt)




end

function Stairs:draw(dt)



    rect:draw(dt)
    lol:draw(dt)

end

return Stairs
