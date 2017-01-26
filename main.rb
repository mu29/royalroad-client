require 'gosu'

class GameWindow < Gosu::Window
  def initialize(width=800, height=600, full_screen=false)
    super
    self.caption = '로열로드 온라인'
    @x = @y = 10
    @draws = 0
    @message = Gosu::Image.from_text(
      self, info, Gosu.default_font_name, 30
    )
  end

  def update
    @x -=1 if button_down?(Gosu::KbLeft)
    @x +=1 if button_down?(Gosu::KbRight)
    @y -=1 if button_down?(Gosu::KbUp)
    @y +=1 if button_down?(Gosu::KbDown)
  end

  def draw
    @draws += 1
    @message.draw(@x, @y, 0)
  end

  def info
    "x:#{@x} y:#{@y} draws:#{@draws}"
  end
end

window = GameWindow.new
window.show
