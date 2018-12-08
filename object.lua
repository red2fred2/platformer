Object = {}
Object.__index = Object

function Object.create(x, y)
  local self = setmetatable({
    x = 0,
    y = 0
  }, Object)

  self.x = x
  self.y = y

  return self
end

function Object:debug()
  --draw hitbox
end
