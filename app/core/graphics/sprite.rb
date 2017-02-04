class Sprite
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z
  attr_accessor :viewport

  def initialize(rect = nil)
    @viewport = Viewport.new(rect)
    @x, @y, @z = 0, 0, 0
  end

  def load_image(path:, source:, rect: nil)
    if path.presence?
      @image = if rect.presence?
        Gosu::Image.new(path, rect)
      else
        Gosu::Image.new(path)
      end
    end
    if source.presence?
      @image = source
    end
  end

  def draw
    x = @viewport.x + @x
    y = @viewport.y + @y
    z = @viewport.z * Config::VIEWPORT_CAPACITY + @z
    width = [@viewport.width - @x, self.width].min
    height = [@viewport.height - @y, self.height].min
    @image.subimage(0, 0, width, height).draw(x, y, z)
  end

  def width
    @image&.width || 0
  end

  def height
    @image&.height || 0
  end
end
