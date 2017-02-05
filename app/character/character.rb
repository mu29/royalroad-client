class Character < Game::Object
  def initialize(x, y)
    super(x, y)
    @graphics = CharacterGraphics.new(self, Cache.character('001-Fighter01'))
  end
end
