class Camera
  attr_reader :viewport, :x, :y

  def target=(target)
    @target = target
    @x = target.x
    @y = target.y
    @viewport = Viewport.new(
      @x - $window.width / 2,
      @y - $window.height / 2,
      $window.width,
      $window.height
    )
  end

  def mouse_coords
    x, y = target_delta_on_screen
    mouse_x_on_map = @target.x +
      x + $window.mouse_x - ($window.width / 2)
    mouse_y_on_map = @target.y +
      y + $window.mouse_y - ($window.height / 2)
    [mouse_x_on_map, mouse_y_on_map].map(&:round)
  end

  def update
    shift = FrameManager.adjust_speed(@target.physics.speed)
    scroll_right(shift) if @x < @target.x
    scroll_left(shift) if @x > @target.x
    scroll_down(shift) if @y < @target.y
    scroll_up(shift) if @y > @target.y
  end

  def target_delta_on_screen
    [(@x - @target.x), (@y - @target.y)]
  end

  def scroll_left(shift)
    @x -= shift
    @viewport.x -= shift
  end

  def scroll_right(shift)
    @x += shift
    @viewport.x += shift
  end

  def scroll_up(shift)
    @y -= shift
    @viewport.y -= shift
  end

  def scroll_down(shift)
    @y += shift
    @viewport.y += shift
  end
end
