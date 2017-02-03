class Tile
  def initialize
    @sprites = []
  end

  def [](id)
    @sprites[id]
  end
end