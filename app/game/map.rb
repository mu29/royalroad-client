class Map
  TILE_SIZE = 32
  attr_reader :id
  attr_reader :name
  attr_accessor :objects

  def initialize
    @id = 0
    @name = ""
    @tileset = ""
    @objects = []
  end

  def setup(map_id)
    @map_data = FileManager.load_map(map_id)
    @id = @map_data[:id]
    @name = @map_data[:name]
    @tileset = @map_data[:tileset]
    load_tiles
  end

  def can_move_to?(x, y)
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
