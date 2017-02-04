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
    map_data = Cache.map_data(map_id)
    map_instance_variables(map_data)
    @tileset = Tileset.new(@tileset_id)
    # TODO sound
    #@bgm = @map_data[:bgm]
    #@bgs = @map_data[:bgs]
    @map = generate_map
  end

  def can_move_to?(x, y, d)
  end

  def draw(viewport)
    viewport.map! { |v| v / TILE_SIZE }
    x0, x1, y0, y1 = viewport.map(&:to_i)
    6.times do |p|
      3.times do |z|
        (x0..x1).each do |x|
          (y0..y1).each do |y|
            tile_id = @map[x][y][z]
            next unless tile_id
            next if @tileset.priorities[tile_id] != p
            tile_id -= 384
            next if tile_id < 0
            tile = @tileset.image[tile_id]
            map_x = x * TILE_SIZE
            map_y = y * TILE_SIZE
            tile.draw(map_x, map_y, 0) if tile
          end
        end
      end
    end
  end

  private

  def generate_map
    # todo : map_data 가지고 타일 아이디 넣어주기
    map = {}
    @width.times do |x|
      map[x] = {}
      @height.times do |y|
        map[x][y] = {}
        3.times do |z|
          map[x][y][z] = @data[x + y * @width + z * @width * @height]
        end
      end
    end
    map
  end
end

