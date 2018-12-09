settings = {
  display = {
    offset = {
      x = 0,
      y = 0
    },
    pixel = {
      size = 1,
      meter = 16,
      x = 16 * 16,
      y = 16 * 9
    },
    colors = {
      primary = {0.5, 1, 0.5},
      secondary = {0.3, 5, 0.3},
      tertiary = {0.7, 8, 0.7},
      accent = {0.2, 1, 0.2},
      warning = {1, 0, 0},
      debug = {1, 0.5, 0.25},
      background = {0.7, 0.2, 0.5}
    }
  },
  input = {
    controls = {
      keyboard = {
        leftDir = {'a', 'left'},
        rightDir = {'d', 'right'},
        jump = {'space', 'w', 'up'},
        crouch = {'lshift', 's', 'down'},
        interact = {'l', 'e', 'r'},
        melee = {'k'},
        shoot = {'j'},
        menu = {'escape'}
      },
      controller = {
        moveX = 1,
        moveY = 2,
        jump = {1},
        crouch = {2},
        interact = {3},
        melee = {5},
        shoot = {6},
        menu = {8}
      }
    },
    keyboard = {

    },
    controller = {
      deadzone = 0.15,
      jumpThreshold = -0.75,
      crouchThreshold = 0.75
    }
  },
  physics = {
    gravity = 9.8
  }
}

function settings.load()
  --load graphics
  love.mouse.setVisible(false)
  love.graphics.setDefaultFilter('nearest', 'nearest')
  screen.updatePixels()

  ingame.load()
end
