class FrameManager
  class << self
    def track_update_interval
      now = Gosu.milliseconds
      @update_interval = (now - (@last_update ||= 0)).to_f
      @last_update = now
    end

    def update_interval
      @update_interval ||= $window.update_interval
    end

    def adjust_speed(speed)
      speed * update_interval / 16.66
    end
  end
end
