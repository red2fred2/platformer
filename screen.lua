--------------------OBJECT--------------------

screen = {}

--------------------CONSTANTS--------------------

local lg = love.graphics
local sd = settings.display
local sdp = sd.pixel

--------------------FUNCTIONS--------------------

function screen.updatePixels(width, height)
  local width = width or lg.getWidth()
  local height = height or lg.getHeight()

  --pixel size
  local xMax = width / sdp.x
  local yMax = height / sdp.y
  sdp.size = math.min(xMax, yMax)

  --center screen
  local xDiff = width - sdp.size * sdp.x
  local yDiff = height - sdp.size * sdp.y
  sd.offset.x = xDiff / sdp.size / 2
  sd.offset.y = yDiff / sdp.size / 2
end

function screen.transformPixels()
  lg.scale(sdp.size, sdp.size)
  lg.translate(sd.offset.x, sd.offset.y) --add camera code here
end

function screen.drawBackground()
  lg.setColor(sd.colors.background)
  lg.rectangle('fill', 0, 0, sdp.x, sdp.y)
end

function screen.drawBlockers()
  lg.origin()
  lg.scale(sdp.size, sdp.size)
  lg.setColor(sd.colors.background)

  lg.rectangle('fill', 0, 0, sd.offset.x, sdp.y)
  lg.rectangle('fill', sdp.x + sd.offset.x, 0, sd.offset.x, sdp.y)
  lg.rectangle('fill', 0, 0, sdp.x, sd.offset.y)
  lg.rectangle('fill', 0, sdp.y + sd.offset.y, sdp.x, sd.offset.y)
end
