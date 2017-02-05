class Viewport
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z
  attr_accessor :width
  attr_accessor :height

  def initialize(*args)
    if args.size == 4
      @x = args[0]
      @y = args[1]
      @width = args[2]
      @height = args[3]
    else
      rect ||= { x: 0, y: 0, width: Config::WINDOW_WIDTH, height: Config::WINDOW_HEIGHT }
      map_instance_variables(rect)
    end
  end

  def rect
    [@x, @y, @width, @height]
  end

  def include?(x, y, w, h)
    x < @x + @width &&
    x + w > @x &&
    y < @y + @height &&
    y + h > @y
  end
end
