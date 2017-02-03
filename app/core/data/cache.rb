class Cache
  class << self
    attr_accessor :image

    def init
      @image = {}
      @data = {}
    end

    def load_image(path)
      yield unless @image.include? path
      @image[path]
    end

    def load_json(path)
      if @data.include? path
        @data[path]
      else
        file = File.read(path)
        @data[path] = Hash.symbolize(JSON.parse(file))
      end
    end

    def animation(file)
      path = FileManager.path("animations/#{file}")
      self.load_image(path) do
        image = Gosu::Image.new(path)
        size = image.width / 5
        @image[path] = Gosu::Image.load_tiles(path, size, size)
      end
    end

    def character(file)
      path = FileManager.path("characters/#{file}")
      self.load_image(path) do
        image = Gosu::Image.new(path)
        size = image.width / 4
        @image[path] = Gosu::Image.load_tiles(path, size, size)
      end
    end

    def tileset(file)
      path = FileManager.path("tilesets/#{file}")
      self.load_image(path) do
        @image[path] = Gosu::Image.load_tiles(path, 32, 32, tileable: true)
      end
    end

    def tileset_data(tileset_id)
      path = FileManager.path(sprintf("tilesets/Tileset%03d.map", tileset_id))
      self.load_json(path)
    end

    def map_data(map_id)
      path = FileManager.path(sprintf("maps/Map%03d.map", map_id))
      self.load_json(path)
    end
  end
end
