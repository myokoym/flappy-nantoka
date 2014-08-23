require "player"

class Player
  class Image
    def initialize(path)
    end
  end
end

class PlayerTest < Test::Unit::TestCase
  include YeahTestUtils

  def test_new
    assert_not_nil(Player.new(10, 20))
  end

  class UpdateTest < self
    def test_no_flap
      @player = Player.new(10, 20)
      @player.update(false)
      assert_equal(21.1, @player.y)
    end

    def test_flap
      @player = Player.new(10, 20)
      @player.update(true)
      assert_equal(15.1, @player.y)
    end
  end

  def test_reset
    @player = Player.new(10, 20)
    @player.update(false)
    @player.reset
    assert_equal(20, @player.y)
  end
end
