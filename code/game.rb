class FlappyNantoka < Game
  def setup
    @player = Player.new(player_x, center_y)
    @pipe = display.width
    @score = 0
  end

  def update(elapsed)
    @paused = !@paused if keyboard.pressed?(:p)
    return if @paused

    game_over if game_over?

    @player.update(pressed?)
    accelerate

    draw
  end

  def draw
    display.fill_color = C[0, 0, 0]
    display.clear
    @player.draw(display)
    display.fill_color = C[100, 100, 100]

    position = V[@pipe, center_y]
    size = V[display.width / 10, center_y]
    display.fill_rectangle(position, size)

    display.font_size = 54
    display.fill_text(@score, V[center_x, 100])
  end

  def player_x
    display.width / 3
  end

  def center_x
    display.width / 2
  end

  def center_y
    display.height / 2
  end

  def accelerate
    @pipe -= 5
    if @pipe < 0
      @pipe = display.width
      @score += 1
    end
  end

  def pressed?
    mouse.pressed?(:left) or
     keyboard.pressed?(:f) or
     keyboard.pressed?(:j)
  end

  def game_over?
    @player.y >= display.height or @player.y <= 0
  end

  def game_over
    @pipe = display.width
    @player.reset
    @score = 0
  end
end
