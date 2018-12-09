--------------------OBJECT--------------------

input = {
  device = 'keyboard',
  keyboard = {},
  controller = {}
}

--------------------CONSTANTS--------------------

local sic = settings.input.controller
local sick = settings.input.controls.keyboard
local sicc = settings.input.controls.controller
local dev = input.device
local key = love.keyboard.isScancodeDown

--------------------GET VALUES--------------------

--x value
function input.getX()
  if dev == 'keyboard' then
    local l = key(sick.leftDir)
    local r = key(sick.rightDir)
    if r and not l then return 1
    elseif l and not r then return -1
    else return 0 end
  elseif dev:isConnected() then
    local val = dev:getAxis(sicc.moveX)
    return input.deadzone(val)
  end
end

--jump value
function input.getJump()
  if dev == 'keyboard' then
    return key(sick.jump)
  elseif dev:isConnected() then
    if dev:getAxis(sicc.moveY) < sic.jumpThreshold then return true end
    return dev:isDown(sicc.jump)
  end
end

--crouch value
function input.getCrouch()
  if dev == 'keyboard' then
    return key(sick.crouch)
  elseif dev:isConnected() then
    if dev:getAxis(sicc.moveY) > sic.crouchThreshold then return true end
    return dev:isDown(sicc.crouch)
  end
end

--interact value
function input.getInteract()
  if dev == 'keyboard' then
    return key(sick.interact)
  elseif dev:isConnected() then
    return dev:isDown(sicc.interact)
  end
end

--melee value
function input.getMelee()
  if dev == 'keyboard' then
    return key(sick.melee)
  elseif dev:isConnected() then
    return dev:isDown(sicc.melee)
  end
end

--shoot value
function input.getShoot()
  if dev == 'keyboard' then
    return key(sick.shoot)
  elseif dev:isConnected() then
    return dev:isDown(sicc.shoot)
  end
end

--menu value
function input.getMenu()
  if dev == 'keyboard' then
    return key(sick.menu)
  elseif dev:isConnected() then
    return dev:isDown(sicc.menu)
  end
end

--------------------OTHER FUNCTIONS--------------------

function input.setDevice(device)
  input.device = device
end

function input.deadzone(value)
  if math.abs(value) > settings.input.controller.deadzone then
    return value
  else
    return 0
  end
end
