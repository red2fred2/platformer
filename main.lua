--------------------IMPORT--------------------

--functions
require 'settings'
require 'screen'
require 'input'

--classes
require 'object'
require 'player'

--states
require 'ingame'

--------------------OBJECT--------------------

game = {
    states = {
    SPLASH      = splash,
    INGAME      = ingame,
    MAIN_MENU   = mainMenu,
    OPTIONS     = options,
    CUTSCENE    = cutscene,
    INGAME_MENU = ingameMenu
  }
}

--------------------CONSTANTS--------------------

DEBUG = true

--------------------START--------------------

function love.load()
  settings.load()
end

--------------------UPDATE--------------------

function love.update(dt)
  game.state.update(dt)
end

--------------------DRAW--------------------
function love.draw()
  screen.transformPixels()
  screen.drawBackground()
  game.state.draw()
  screen.drawBlockers()
end

--------------------END--------------------

function love.quit()

end

--------------------CALLBACK FUNCTIONS--------------------

function love.resize(width, height)
  screen.updatePixels(width, height)
end

function love.gamepadpressed(joystick, button)
  input.setDevice(joystick)
end

function love.keypressed(key, scancode, isrepeat)
  input.setDevice('keyboard')
end

function love.joystickadded(joystick)
  input.setDevice(joystick)
end

function love.joystickremoved(joystick)
  if input.device == joystick then
    input.setDevice('keyboard')
  end
end
