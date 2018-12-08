Object = {}
Object.__index = Object

function Object.create()
  local self = setmetatable({}, Object)

  return self
end

function Object:debug()
  
end
