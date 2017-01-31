class Cache
  class << self
    @@cache = {}

    def animation(file)
      path = FileManager.path("animations/#{file}")
      if @@cache.include? path
        @@cache[path]
      else
        image = Gosu::Image.new(path)
        size = image.width / 5
        @@cache[path] = Gosu::Image.load_tiles(path, size, size)
      end
    end

    def character(file)
      path = FileManager.path("characters/#{file}")
      if @@cache.include? path
        @@cache[path]
      else
        image = Gosu::Image.new(path)
        size = image.width / 4
        @@cache[path] = Gosu::Image.load_tiles(path, size, size)
      end
    end

    def tileset(file)
      path = FileManager.path("tilesets/#{file}")
      if @@cache.include? path
        @@cache[path]
      else
        @@cache[path] = Gosu::Image.load_tiles(path, 32, 32)
      end
    end
    
    def map(map_id)
      path = FileManager.path(sprintf("maps/BMap%3d.map", map_id))
      if @@cache.include? path
        @@cache[path]
      else
        file = File.read(path)
        @@cache = JSON.parse file
      end
    end
  end
end
