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
    return unless viewport.include?(x, y, @width * 2, @height * 2)
    @image[0].draw(x, y, 0)
  end
end
