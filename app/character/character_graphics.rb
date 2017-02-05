class CharacterGraphics < Component
  def initialize(object = nil, image = nil)
    super(object)
    if image.presence?
      @image = image
      @width = @image[0].width
      @height = @image[0].height
    end
  end

  def draw(viewport)
    return unless viewport.include?(x, y, @width, @height)
    current_image.draw(x, y, 0)
  end

  private

  def current_image
    physics = object.physics
    direction = physics.direction
    current_frame = (direction / 2 - 1) * 4
    if physics.moving?
      current_frame += (physics.vertical? ? object.y : object.x) % 64 / 16 
    end
    @image[current_frame]
  end
end
