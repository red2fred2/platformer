--------------------OBJECT--------------------

ingame = {}

ingame.objects = {}

--------------------WORLD OBJECTS--------------------


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
