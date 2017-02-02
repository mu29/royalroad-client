class LoginScene < Scene
  def initialize
  end

  def enter
  end

  def leave
  end

  def draw
  end

  def button_down(id)
    if id == Gosu::KbN
      @play_scene = PlayScene.new
      Scene.switch(@play_scene)
    end
  end
end
