--------------------OBJECT--------------------

Object = {}
Object.__index = Object

--------------------START--------------------

function Object.create()
  local self = setmetatable({}, Object)

  return self
end

--------------------DEBUG--------------------

function Object:debug()

end

--------------------FUNCTIONS--------------------
