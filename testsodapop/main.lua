function love.load()
  sodapop = require 'sodapop'

  playerSprite = sodapop.newAnimatedSprite(100, 200)
  playerSprite:addAnimation('run', {
    image        = love.graphics.newImage 'run.png',
    frameWidth   = 146.17,
    frameHeight  = 204,
    frames       = {
      {1, 1, 12, 1, 0.08},
    },
  })
  playerSprite:addAnimation('duck', {
    image       = love.graphics.newImage 'duck.png',
    frameWidth  = 133,
    frameHeight = 200,
    stopAtEnd   = true,
    reverse      = true,
    frames      = {
      {1, 1, 4, 1, 0.08},
      {4, 1, 1, 1, 0.08}
    },
  })
  playerSprite:addAnimation('jump', {
    image        = love.graphics.newImage 'jump.png',
    frameWidth   = 101,
    frameHeight  = 200,
    stopAtEnd    = true,
    reverse      = true,
    onReachedEnd = function() playerSprite:switch 'run' end,
    frames       = {
      {1, 1, 4, 1, 0.08},
      {4, 1, 1, 1, 0.08},
    },
  })
end

function love.update(dt)
  playerSprite:update(dt)
end

function love.keypressed(key)
  if key == 'left' then playerSprite.flipX = true end
  if key == 'right' then playerSprite.flipX = false end
  if key == 'down' then playerSprite:switch 'duck' end
  if key == 'up' then playerSprite:switch 'jump' end
end

function love.draw()
  playerSprite:draw()
end
