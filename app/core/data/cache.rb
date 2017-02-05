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
      path = FileManager.path("animations/#{file}.png")
      self.load_image(path) do
        image = Sprite.load_image(path)
        size = image.width / 5
        @image[path] = Tile.load_image(path: path, size: size)
      end
    end

    def character(file)
      path = FileManager.path("characters/#{file}.png")
      self.load_image(path) do
        image = Sprite.load_image(path)
        width = image.width / 4
        height = image.height / 4
        @image[path] = Tile.load_image(path: path, width: width, height: height)
      end
    end

    def tileset(file)
      path = FileManager.path("tilesets/#{file}.png")
      self.load_image(path) do
        @image[path] = Tile.load_image(path: path, size: 32)
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
