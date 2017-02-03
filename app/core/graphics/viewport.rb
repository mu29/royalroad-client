class Viewport
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z
  attr_accessor :width
  attr_accessor :height

  def initialize(rect = nil)
    @z = 0
    rect ||= { x: 0, y: 0, width: Config::WINDOW_WIDTH, height: Config::WINDOW_HEIGHT }
    map_instance_variables(rect)
  end

  def rect
    [@x, @y, @width, @height]
  end
end
