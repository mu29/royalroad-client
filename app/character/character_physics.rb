class CharacterPhysics < Component
  attr_reader :direction
  attr_accessor :speed

  def initialize(object = nil)
    super(object)
    @direction = Direction::DOWN
    @speed = 2
  end

  def update
    return unless moving?
    return if @speed <= 0
    new_x, new_y = x, y
    shift = FrameManager.adjust_speed(@speed)
    case @direction
    when Direction::DOWN
      new_y += shift
    when Direction::LEFT
      new_x -= shift
    when Direction::RIGHT
      new_x += shift
    when Direction::UP
      new_y -= shift
    end
    if Map.can_move_to?(new_x, new_y)
      object.move(new_x, new_y)
    end
  end

  def turn_down
    @direction = Direction::DOWN
  end

  def turn_left
    @direction = Direction::LEFT
  end

  def turn_right
    @direction = Direction::RIGHT
  end

  def turn_up
    @direction = Direction::UP
  end

  def move_down
    turn_down
    @moving = true
  end

  def move_left
    turn_left
    @moving = true
  end

  def move_right
    turn_right
    @moving = true
  end

  def move_up
    turn_up
    @moving = true
  end

  def moving?
    @moving
  end

  def vertical?
    [Direction::UP, Direction::DOWN].include?(@direction)
  end

  def horizontal?
    [Direction::LEFT, Direction::RIGHT].include?(@direction)
  end
end
