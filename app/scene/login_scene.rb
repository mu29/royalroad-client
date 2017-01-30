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
      @map_scene = MapScene.new
      Scene.switch(@map_scene)
    end
  end
end
