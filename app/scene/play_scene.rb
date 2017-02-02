class PlayScene < Scene
  def initialize
    p "Enter #{self}"
    @map = Map.new
    @map.setup(1)
    #@camera = Camera.new

    @object_pool = ObjectPool.instance
  end

  def update
    @object_pool.update
    #@camera.update
  end

  def draw

    return
    cam_x = @camera.x
    cam_y = @camera.y
    off_x =  $window.width / 2 - cam_x
    off_y =  $window.height / 2 - cam_y
    viewport = @camera.viewport
    $window.translate(off_x, off_y) do
      zoom = @camera.zoom
      $window.scale(zoom, zoom, cam_x, cam_y) do
        @map.draw(viewport)
        @object_pool.draw(viewport)
      end
    end
  end

  def button_down(id)
  end
end
