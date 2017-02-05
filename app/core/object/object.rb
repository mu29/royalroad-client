module Game
  class Object
    attr_accessor :x
    attr_accessor :y

    def initialize(x, y)
      @x, @y = x, y
      @width, @height = 0
      @components = []
      ObjectPool << self
    end

    def components
      @components
    end

    def update
      @components.map(&:update)
    end

    def draw(viewport)
      @components.each { |c| c.draw(viewport) }
    end

    def removable?
      @removable
    end

    def mark_for_removal
      @removable = true
    end

    def move(new_x, new_y)
      return if new_x == @x && new_y == @y
      @x = new_x
      @y = new_y
    end
  end
end