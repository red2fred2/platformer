Player = {}
Player.__index = Player

function Player.create(x, y)
  local self = setmetatable({
    x = 0,
    y = 0,
    speed = 75
  }, Player)

  self.x = x
  self.y = y

  return self
end

function Player:update(dt)

end

function Player:draw()

end
