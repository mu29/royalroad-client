class LoginScene < Scene
  def initialize
    @sprite = Sprite.new(x: 200, y: 100, width: 500, height: 500)
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
