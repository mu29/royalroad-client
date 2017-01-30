class Camera
  attr_accessor :x, :y, :zoom

  def target=(target)
    @target = target
    @x, @y = target.x, target.y
    @zoom = 1
  end

  def mouse_coords
    x, y = target_delta_on_screen
    mouse_x_on_map = @target.x +
      (x + $window.mouse_x - ($window.width / 2)) / @zoom
    mouse_y_on_map = @target.y +
      (y + $window.mouse_y - ($window.height / 2)) / @zoom
    [mouse_x_on_map, mouse_y_on_map].map(&:round)
  end

  def update
    shift = FrameManager.adjust_speed(@target.physics.speed)
    @x += shift if @x < @target.x - $window.width / 4
    @x -= shift if @x > @target.x + $window.width / 4
    @y += shift if @y < @target.y - $window.height / 4
    @y -= shift if @y > @target.y + $window.height / 4
  end

  def target_delta_on_screen
    [(@x - @target.x) * @zoom, (@y - @target.y) * @zoom]
  end

  def viewport
    x0 = @x - ($window.width / 2)  / @zoom
    x1 = @x + ($window.width / 2)  / @zoom
    y0 = @y - ($window.height / 2) / @zoom
    y1 = @y + ($window.height / 2) / @zoom
    [x0, x1, y0, y1]
  end
end
