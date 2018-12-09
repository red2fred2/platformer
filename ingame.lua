--------------------OBJECT--------------------

ingame = {}

--------------------WORLD OBJECTS--------------------

ingame.objects = {}


--------------------START--------------------

function ingame.load()
  game.state = game.states.INGAME
end

--------------------UPDATE--------------------

function ingame.update(dt)

  if input.getMenu() then
    love.event.quit('Player Exited Game')
  end

end

--------------------DRAW--------------------

function ingame.draw()

end
