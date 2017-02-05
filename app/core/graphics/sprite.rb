class Sprite
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z
  attr_accessor :viewport

  def initialize(viewport = nil)
    viewport ||= Viewport.new
    @viewport = viewport
    @x, @y, @z = 0, 0, 0
  end

  def load_image(path:, rect: nil)
    @image = if rect.presence?
      Gosu::Image.new(path, rect)
    else
      Gosu::Image.new(path)
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

  def self.load_image(path, rect = nil)
    Sprite.new.tap { |s| s.load_image(path: path, rect: rect) }
  end
end
