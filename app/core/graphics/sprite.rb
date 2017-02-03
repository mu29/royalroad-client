class Sprite
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z
  attr_accessor :viewport

  def initialize(rect = nil)
    @viewport = Viewport.new(rect)
    @x, @y, @z = 0, 0, 0
  end

  def load_cache(path:, rect: nil)
    path = FileManager.path(path)
    @image = Cache.load_image(path) do
      Cache.image[path] = if rect.nil?
        Gosu::Image.new(path)
      else
        Gosu::Image.new(path, rect)
      end
    end
  end

  def load_image(path:, rect: nil)
    path = FileManager.path(path)
    @image = if rect.nil?
      Gosu::Image.new(path)
    else
      Gosu::Image.new(path, rect)
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
