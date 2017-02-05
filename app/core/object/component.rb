class Component
  def initialize(object = nil)
    @width, @height = 0
    self.object = object
  end

  def update
  end

  def draw(viewport)
  end

  protected

  def object
    @object
  end

  def object=(obj)
    if obj
      @object = obj
      obj.components << self
    end
  end

  def x
    @object.x
  end

  def y  
    @object.y
  end
end
