class ObjectPool
  attr_accessor :objects

  @@instance = nil

  def self.instance
    @@instance ||= ObjectPool.new
  end

  def initialize
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
