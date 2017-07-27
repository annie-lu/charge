Gamestate = require 'hump.gamestate'

local Bedroom = {}

local Player = require 'stairslevel/playerTest2'
local Charger = require 'bedroomlevel.charger'

local p = Player(100, 350, true, false)
local char = Charger(400, 500)

local e = false

function Bedroom:update(dt)
  p:update(dt)


end

function Bedroom:draw()
  char:draw()
  p:draw()
  love.graphics.print("You found the charger! Press 'e' to pick it up!", 100, 80)
  if love.keyboard.isDown('e') then
    love.graphics.print("u pressed e nice", 100, 100)
  end
end



return Bedroom
