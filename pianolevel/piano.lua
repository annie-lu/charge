Gamestate = require 'hump.gamestate'
local Kitchen = require 'kitchenlevel.kitchen'

local Piano = {}

a = love.audio.newSource("pianolevel/A.wav", "static")
b = love.audio.newSource("pianolevel/B.wav", "static")
c = love.audio.newSource("pianolevel/C.wav", "static")
d = love.audio.newSource("pianolevel/D.wav", "static")
e = love.audio.newSource("pianolevel/E.wav", "static")
 -- the "static" tells LÖVE to load the file into memory, good for short sound effects
--music = love.audio.newSource("techno.ogg") if "static" is omitted, LÖVE will stream the file from disk, good for longer music tracks
nokey = love.graphics.newImage("pianolevel/none.png")
akey = love.graphics.newImage("pianolevel/A.png")
bkey = love.graphics.newImage("pianolevel/B.png")
ckey = love.graphics.newImage("pianolevel/C.png")
dkey = love.graphics.newImage("pianolevel/D.png")
ekey = love.graphics.newImage("pianolevel/E.png")
sheetmusic =  love.graphics.newImage("pianolevel/notes.png")
sandstorm = {"b","b","b","b","b","b","b",
"b","b","b","b","b","e","e",
"e","e","e","e","e","d","d",
"d","d","d","d","d","a",
"b","b","b","b","b","b","b",
"b","b","b","b","b","e","e",
"b","b","b","b","b","b","b",
"b","b","b","b","b","e","e",
"b","b","b","b","b","b","b",
"b","b","b","b","b","e","e",
"e","e","e","e","e","d","d",
"d","d","d","d","d","a","b"
}

i = 1
final = 2 --should be 84


function Piano:draw()
  if i==final then
  love.graphics.print("done", 50, 50)
    Gamestate.switch(Kitchen)
elseif love.keyboard.isDown('a') then
  	love.graphics.draw(akey, 0, 0)
elseif love.keyboard.isDown('b') then
  	love.graphics.draw(bkey, 0, 0)
elseif love.keyboard.isDown('c') then
  	love.graphics.draw(ckey, 0, 0)
elseif love.keyboard.isDown('d') then
  	love.graphics.draw(dkey, 0, 0)
elseif love.keyboard.isDown('e') then
  	love.graphics.draw(ekey, 0, 0)
else
	love.graphics.draw(nokey, 0, 0)
end
	love.graphics.draw(sheetmusic, 0, 0)
end

function Piano:keyreleased( key ) --can we shorten this im still not sure how to use this parameter
  if key == sandstorm[i] then
  i=i+1
else
  i=1
end

  if key == "a" then
      a:play()
  elseif key == "b" then
        b:play()
  elseif key == "c" then
          c:play()
  elseif key == "d" then
            d:play()
  elseif key == "e" then
              e:play()
            end
end

return Piano
