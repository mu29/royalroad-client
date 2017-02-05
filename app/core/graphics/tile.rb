class Tile
  def initialize(source = nil)
    @sprites = source
  end

  def [](id)
    @sprites[id]
  end

  def load_image(path:, size: nil, width: nil, height: nil)
    @sprites = if size.presence?
      Gosu::Image.load_tiles(path, size, size, tileable: true)
    else
      Gosu::Image.load_tiles(path, width, height, tileable: true)
    end
  end

  def self.load_image(path:, size: nil, width: nil, height: nil)
    Tile.new.tap { |t| t.load_image(path: path, size: size, width: width, height: height) }
  end
end
