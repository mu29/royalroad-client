class Window < Gosu::Window
  attr_accessor :scene

  def initialize
    super(800, 600, false)
  end

  def update
    FrameManager.track_update_interval
    @scene.update
  end

  def draw
    @scene.draw
  end

  def needs_redraw?
    @scene.needs_redraw?
  end

  def needs_cursor?
    FrameManager.update_interval > 200
  end

  def button_down(id)
    @scene.button_down(id)
  end
end
