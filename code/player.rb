class Player
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @default_y = y
    @image = Image.new("images/meat.png")
    @speed = default_speed
  end

  def update(pressed)
    flap if pressed
    accelerate
  end

  def draw(display)
    display.image(@image, V[@x, @y])
  end

  def reset
    @speed = default_speed
    @y = @default_y
  end

  private
  def default_speed
    10
  end

  def accelerate
    @speed += 1
    @y += @speed * 0.1
  end

  def flap
    @speed = -50
  end
end
