class Sprite
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z
  attr_accessor :viewport

  def initialize(viewport = nil)
    viewport ||= Viewport.new
    self.viewport = viewport
    x, y, z = 0
  end

  def load_image(path:, rect:)
    path = FileManager.path(path)
    @image = Cache.load_file(path) do
      Cache.cache[path] = if rect.nil?
        Gosu::Image.new(path)
      else
        Gosu::Image.new(path, rect)
      end
    end
  end

  def draw
    @image.draw(x, y, z)
  end

  def width
    @image&.width || 0
  end

  def height
    @image&.height || 0
  end
end
