function love.conf(t)
    t.identity = 'platformer'
    t.window.title = 'platformer'
    t.version = '11.2'
    t.console = false
    t.window.icon = nil
    t.window.width = 16*16*4
    t.window.height = 16*9*4
    t.window.minwidth = 16*16
    t.window.minheight = 16*9
    t.window.borderless = false
    t.window.resizable = true
    t.window.fullscreen = true
    t.window.fullscreentype = 'desktop'
    t.window.vsync = true
    t.window.msaa = 0
    t.window.highdpi = false
end
