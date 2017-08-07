Gamestate = require 'hump.gamestate'

local Bedroom = {}

local Player = require 'stairslevel/playerTest2'
local Charger = require 'bedroomlevel.charger'
local Bedroom2 = require 'bedroomlevel.bedroom2'
local screen= love.graphics.newImage("bedroomlevel/bedroomgame1.png")

local p = Player(100, 250, true, false)
local char = Charger(400, 500)

local e = false

local text = ""

function Bedroom:update(dt)
  p:update(dt)
  if love.keyboard.isDown('e') then
    --text = "nice u pressed e"
  end

  if p:getBB():collidesWith(char:getBB()) and love.keyboard.isDown('e') then
    Gamestate.switch(Bedroom2)
  end

end

function Bedroom:draw()
  love.graphics.draw(screen, 0, 0)
  char:draw()
  p:draw()
end



return Bedroom
