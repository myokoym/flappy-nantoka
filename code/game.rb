class FlappyNantoka < Game
  def setup
    @y = center_y
    @x = center_x
    @image = Image["images/meat.png"]
    @speed = default_speed
  end

  def update(elapsed)
    game_over if game_over?

    flap if pressed?
    accelerate

    display.clear
    display.image(@image, V[@x, @y])
  end

  private
  def default_speed
    10
  end

  def center_x
    display.width / 2
  end

  def center_y
    display.height / 2
  end

  def accelerate
    @speed += 1
    @y += @speed * 0.1
  end

  def flap
    @speed = -50
  end

  def pressed?
    mouse.pressed?(:left) or
     keyboard.pressed?(:f) or
     keyboard.pressed?(:j)
  end

  def game_over?
    @y >= display.height or @y <= 0
  end

  def game_over
    @speed = default_speed
    @y = center_y
  end
end
