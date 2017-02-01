class Animation < GameObject
  attr_accessor :x, :y

  FRAME_DELAY = 16.66 # ms

  def initialize(animation, object_pool, x, y)
    super(object_pool)
    @animation = Cache.animation(animation)
    @x, @y = x, y
    @current_frame = 0
  end

  def draw(viewport)
    image = current_frame
    image.draw(x - image.width / 2, y - image.height / 2, 0)
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
