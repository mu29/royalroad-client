class Tile
  def initialize(source = nil)
    @sprites = source
  end

  def [](id)
    @sprites[id]
  end

  def load_image(path:, source:, size:)
    if path.presence?
      @sprites = Gosu::Image.load_tiles(path, size, size)
    end
    if source.presence?
      @sprites = source
    end
  end
end