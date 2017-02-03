class LoginScene < Scene
  def initialize
    @sprite = Sprite.new
    @sprite.load_image(path: 'test.png')
  end

  def enter
  end

  def leave
  end

  def draw
    @sprite.draw
  end

  def button_down(id)
    if id == Gosu::KbN
      @play_scene = PlayScene.new
      Scene.switch(@play_scene)
    end
  end
end
