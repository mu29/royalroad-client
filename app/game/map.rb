class Map
  MAP_WIDTH = 100
  MAP_HEIGHT = 100
  TILE_SIZE = 32
  attr_accessor :objects

  def initialize
    load_tiles
    @map = generate_map
    @objects = []
  end

  def can_move_to?(x, y)
    tile = tile_at(x, y)
    tile
  end

  def draw(viewport)
    viewport.map! { |p| p / TILE_SIZE }
    x0, x1, y0, y1 = viewport.map(&:to_i)
    (x0..x1).each do |x|
      (y0..y1).each do |y|
        row = @map[x]
        if row
          tile = @map[x][y]
          map_x = x * TILE_SIZE
          map_y = y * TILE_SIZE
          tile.draw(map_x, map_y, 0) if tile
        end
      end
    end
  end

  private

  def tile_at(x, y)
    t_x = ((x / TILE_SIZE) % TILE_SIZE).floor
    t_y = ((y / TILE_SIZE) % TILE_SIZE).floor
    row = @map[t_x]
    row[t_y] if row
  end

  def load_tiles
    @tiles = Gosu::Image.load_tiles(FileManager.load('ground.png'), 32, 32, tileable: true)
  end

  def generate_map
    map = {}
    MAP_WIDTH.times do |x|
      map[x] = {}
      MAP_HEIGHT.times do |y|
        map[x][y] = choose_tile
      end
    end
    map
  end

  def choose_tile
    @tiles[0]
  end
end
