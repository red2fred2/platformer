--------------------OBJECT--------------------
local gravity = settings.physics.gravity * love.physics.getMeter()

ingame = {}
ingame.world = love.physics.newWorld(0, gravity, true)

gravity = nil

ingame.objects = {}

--------------------WORLD OBJECTS--------------------

--ground
ingame.objects.ground = {}
local ground = ingame.objects.ground

ground.body = love.physics.newBody(ingame.world, 16*16-16, 2*(16*9-16))
ground.shape = love.physics.newRectangleShape(2*(16*16-16), 2*16)
ground.fixture = love.physics.newFixture(ground.body, ground.shape)
ground = nil

--player
ingame.objects.player = {}
local player = ingame.objects.player

player.body = love.physics.newBody(ingame.world, 0, 0, 'dynamic')
player.shape = love.physics.newRectangleShape(16*2, 28*2)
player.fixture = love.physics.newFixture(player.body, player.shape, 1)
player.body:setFixedRotation(true)

--------------------START--------------------

function ingame.load()
  game.state = game.states.INGAME
end

--------------------UPDATE--------------------

function ingame.update(dt)

  --move on input
  ingame.objects.player.body:applyForce(input.getX() * love.physics.getMeter() * 10, 0)
  --cap speed
  local xVel, yVel = ingame.objects.player.body:getLinearVelocity()
  if xVel > 10 * love.physics.getMeter() then
    xVel = 10 * love.physics.getMeter()
  end
  ingame.objects.player.body:setLinearVelocity(xVel, yVel)

  if input.getInteract() then
    ingame.objects.player.body:setPosition(0, 0)
    ingame.objects.player.body:setLinearVelocity(0, 0)
  end

  if input.getMenu() then
    love.event.quit('Player Exited Game')
  end

  ingame.world:update(dt)
end

--------------------DRAW--------------------

function ingame.draw()
  love.graphics.setColor(settings.display.colors.primary)

  if DEBUG then
    love.graphics.setColor(settings.display.colors.debug)
    love.graphics.polygon('fill', ingame.objects.ground.body:getWorldPoints(ingame.objects.ground.shape:getPoints()))
    love.graphics.polygon('fill', ingame.objects.player.body:getWorldPoints(ingame.objects.player.shape:getPoints()))
    love.graphics.setColor(settings.display.colors.warning)
    love.graphics.rectangle('fill', 0, 0, 16, 16)
  end
end
