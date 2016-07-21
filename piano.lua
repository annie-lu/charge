a = love.audio.newSource("a.mp4", "static")
b = love.audio.newSource("b.mp4", "static")
c = love.audio.newSource("c.mp4", "static")
d = love.audio.newSource("d.mp4", "static")
e = love.audio.newSource("e.mp4", "static")
 -- the "static" tells LÖVE to load the file into memory, good for short sound effects
--music = love.audio.newSource("techno.ogg") if "static" is omitted, LÖVE will stream the file from disk, good for longer music tracks

function love.keyreleased( key )
--if key == "a" then
    key:play() --not sure if this would work, will test out at home

end
