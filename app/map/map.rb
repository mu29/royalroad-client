class Map
  TILE_SIZE = 32
  attr_reader :id
  attr_reader :name
  attr_accessor :objects

  def initialize
    @id = 0
    @width = 20
    @height = 15
    @name = ""
    @tileset_id = -1
    @tileset = ""
    @objects = []
  end

  def setup(map_id)
    # /resources/maps/Map*.json
    @map_data = Cache.load_map_json(map_id)
    @id = @map_data[:id]
    @name = @map_data[:name]
    @tileset_id = @map_data[:tileset_id]
    @tileset = Tileset.new(@tileset_id)
    @autoplay_bgm = @map_data[:autoplay_bgm] # Boolean
    @autoplay_bgs = @map_data[:autoplay_bgs] # Boolean
    @width = @map_data[:width]
    @height = @map_data[:height]
    @data = @map_data[:data]
    # TODO sound
    #@bgm = @map_data[:bgm]
    #@bgs = @map_data[:bgs]
    @map = generate_map
    load_tiles
  end

  def can_move_to?(x, y, d)
  end

  def draw(viewport)
    viewport.map! { |p| p / TILE_SIZE }
    x0, x1, y0, y1 = viewport.map(&:to_i)
    6.times do |p|
      3.times do |z|
        (x0..x1).each do |x|
          (y0..y1).each do |y|
            tile_id = @map[x][y][z]
            # todo : tileset 정보 가지고 priority 맞는지 확인하기
            if tile_id
              tile = @map[x][y]
              map_x = x * TILE_SIZE
              map_y = y * TILE_SIZE
              tile.draw(map_x, map_y, 0) if tile
            end
          end
        end
      end
    end
  end

  private

  def load_tiles

    @tiles = Gosu::Image.load_tiles(FileManager.path("tilesets/001-Grassland01.png"), 32, 32, tileable: true)
    #.load_tiles(source, tile_width, tile_height, options = {}) ⇒ Array<Gosu::Image>
    #@tiles = Gosu::Image.load_tiles(FileManager.path("tilesets/001-Grassland01.png"), 32, 32, tileable: true)
    #@tiles[0].draw(0, 0, 1.0)
    #p @tiles.size
  end

  def generate_map
    # todo : map_data 가지고 타일 아이디 넣어주기
    map = {}
    @width.times do |x|
      map[x] = {}
      @height.times do |y|
        map[x][y] = {}
        3.times do |z|
          map[x][y][z] = 0
        end
      end
    end
    map
  end

  def choose_tile
    @tiles[0]
  end
end

