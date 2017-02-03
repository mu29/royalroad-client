class Cache
  class << self
    attr_accessor :cache

    def init
      @cache = {}
    end

    def load_file(path)
      yield unless @cache.include? path
      @cache[path]
    end

    def load_json(path)
      if @cache.include? path
        @cache[path]
      else
        file = File.read(path)
        @cache[path] = Hash.symbolize(JSON.parse(file))
      end
    end

    def animation(file)
      path = FileManager.path("animations/#{file}")
      self.load_file(path) do
        image = Gosu::Image.new(path)
        size = image.width / 5
        @cache[path] = Gosu::Image.load_tiles(path, size, size)
      end
    end

    def character(file)
      path = FileManager.path("characters/#{file}")
      self.load_file(path) do
        image = Gosu::Image.new(path)
        size = image.width / 4
        @cache[path] = Gosu::Image.load_tiles(path, size, size)
      end
    end

    def tileset(file)
      path = FileManager.path("tilesets/#{file}")
      self.load_file(path) do
        @cache[path] = Gosu::Image.load_tiles(path, 32, 32)
      end
    end
=begin
    def map(map_id)
      path = FileManager.path(sprintf("maps/BMap%3d.map", map_id))
      self.load_json(path)
    end
    
    def tileset(map_id)
      path = FileManager.path(sprintf("maps/BMap%3d.map", map_id))
      self.load_json(path)
    end
=end
    def load_tileset_json(tileset_id)
      path = FileManager.path(sprintf("tilesets/Tileset%03d.map", tileset_id))
      self.load_json(path)
    end

    def load_map_json(map_id)
      path = FileManager.path(sprintf("maps/Map%03d.map", map_id))
      self.load_json(path)
    end

  end
end
