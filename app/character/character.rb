class Character < Game::Object
  attr_accessor :graphics
  attr_accessor :physics

  def initialize(x, y)
    super(x, y)
    @physics = CharacterPhysics.new(self)
    @graphics = CharacterGraphics.new(self, Cache.character('001-Fighter01'))
  end
end
