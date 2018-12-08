--------------------OBJECT--------------------

input = {
  device = 'keyboard',
  keyboard = {},
  controller = {}
}

--------------------CONSTANTS--------------------

local si = settings.input
local sick = si.controls.keyboard
local sicc = si.controls.controller

--------------------GET VALUES--------------------

--x value
function input.getX()
  if input.device == 'keyboard' then
    return input.keyboard.getX()
  elseif input.device:isConnected() then
    return input.controller.getX()
  else
    return nil
  end
end

function input.keyboard.getX()
local value = 0

  if love.keyboard.isScancodeDown(sick.leftDir) then
    value = value - 1
  end
  if love.keyboard.isScancodeDown(sick.rightDir) then
    value = value + 1
  end

  return value
end

function input.controller.getX()
  local value = input.device:getAxis(sicc.moveX)
  return input.deadzone(value)
end

--jump value
function input.getJump()
  if input.device == 'keyboard' then
    return input.keyboard.getJump()
  elseif input.device:isConnected() then
    return input.controller.getJump()
  else
    return nil
  end
end

function input.keyboard.getJump()
  return love.keyboard.isScancodeDown(sick.jump)
end

function input.controller.getJump()
  local value = input.device:isDown(sicc.jump)

  if input.device:getAxis(sicc.moveY) < si.controller.jumpThreshold then
    value = true
  end

  return value
end

--crouch value
function input.getCrouch()
  if input.device == 'keyboard' then
    return input.keyboard.getCrouch()
  elseif input.device:isConnected() then
    return input.controller.getCrouch()
  else
    return nil
  end
end

function input.keyboard.getCrouch()
  return love.keyboard.isScancodeDown(sick.crouch)
end

function input.controller.getCrouch()
  local value = input.device:isDown(sicc.crouch)

  if input.device:getAxis(sicc.moveY) > si.controller.crouchThreshold then
    value = true
  end

  return value
end

--interact value
function input.getInteract()
  if input.device == 'keyboard' then
    return input.keyboard.getInteract()
  elseif input.device:isConnected() then
    return input.controller.getInteract()
  else
    return nil
  end
end

function input.keyboard.getInteract()
  return love.keyboard.isScancodeDown(sick.interact)
end

function input.controller.getInteract()
  return input.device:isDown(sicc.interact)
end

--melee value
function input.getMelee()
  if input.device == 'keyboard' then
    return input.keyboard.getMelee()
  elseif input.device:isConnected() then
    return input.controller.getMelee()
  else
    return nil
  end
end

function input.keyboard.getMelee()
  return love.keyboard.isScancodeDown(sick.melee)
end

function input.controller.getMelee()
  return input.device:isDown(sicc.melee)
end

--shoot value
function input.getShoot()
  if input.device == 'keyboard' then
    return input.keyboard.getShoot()
  elseif input.device:isConnected() then
    return input.controller.getShoot()
  else
    return nil
  end
end

function input.keyboard.getShoot()
  return love.keyboard.isScancodeDown(sick.shoot)
end

function input.controller.getShoot()
  return input.device:isDown(sicc.shoot)
end

--menu value
function input.getMenu()
  if input.device == 'keyboard' then
    return input.keyboard.getMenu()
  elseif input.device:isConnected() then
    return input.controller.getMenu()
  else
    return nil
  end
end

function input.keyboard.getMenu()
  return love.keyboard.isScancodeDown(sick.menu)
end

function input.controller.getMenu()
  return input.device:isDown(sicc.menu)
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
