class Animation < Component
  FRAME_DELAY = 16.66 # ms

  def initialize(object, file)
    super(object)
    @animation = Cache.animation(file)
    @width = @animation[0].width
    @height = @animation[0].height
    @current_frame = 0
  end

  def draw(viewport)
    current_frame.draw(x, y, 0)
  end

  def update
    now = Gosu.milliseconds
    delta = now - (@last_frame ||= now)
    if delta > FRAME_DELAY
      @last_frame = now
    end
    @current_frame += (delta / FRAME_DELAY).floor
    object.mark_for_removal if done?
  end

  private

  def current_frame
    @animation[@current_frame % @animation.size]
  end

  def done?
    @done ||= @current_frame >= @animation.size
  end
end
