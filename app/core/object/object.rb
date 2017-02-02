class Object
  def initialize
    @components = []
    ObjectPool.instance << self
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
end
