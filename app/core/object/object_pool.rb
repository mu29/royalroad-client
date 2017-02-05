class ObjectPool
  class << self
    attr_accessor :objects

    def init
      @objects = []
    end

    def update
      @objects.reject!(&:removable?)
      @objects.map(&:update)
    end

    def draw(viewport)
      @objects.each { |o| o.draw(viewport) }
    end

    def << (value)
      @objects << value
    end
  end
end
