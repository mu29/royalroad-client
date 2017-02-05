class PlayScene < Scene
  def initialize
    Map.setup(1)
    @viewport = Viewport.new(0, 0, 1024, 768)
    @c = Character.new(0, 0)
    @count = 0
    @camera = Camera.new
    @camera.target = @c
  end

  def update
    ObjectPool.update
    @count += 1
    if @count % 800 == 0
      @c.physics.move_up
    elsif @count % 600 == 0
      @c.physics.move_right
    elsif @count % 400 == 0
      @c.physics.move_left
    elsif @count % 200 == 0
      @c.physics.move_down
    end
    @camera.update
  end

  def draw
    cam_x = @camera.x
    cam_y = @camera.y
    off_x =  $window.width / 2 - cam_x
    off_y =  $window.height / 2 - cam_y
    viewport = @camera.viewport
    $window.translate(off_x, off_y) do
      Map.draw(viewport)
      ObjectPool.draw(viewport)
    end
  end

  def button_down(id)
  end
end
