Object = {}
Object.__index = Object

function Object.create(x, y)
  local self = setmetatable({}, Object)

  self.x = x
  self.y = y

  return self
end

function Object:debug()
  --draw hitbox
end
