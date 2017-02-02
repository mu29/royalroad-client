class Scene
  def self.switch(new_scene)
    $window.scene && $window.scene.leave
    $window.scene = new_scene
    new_scene.enter
  end

  def enter
  end

  def leave
  end

  def draw
  end

  def update
  end

  def needs_redraw?
    true
  end

  def button_down(id)
  end
end