--------------------OBJECT--------------------

Player = {}
Player.__index = Player

--------------------START--------------------

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

--------------------DEBUG--------------------

function Player:debug()

end

--------------------FUNCTIONS--------------------
