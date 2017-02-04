
# 2017.02.03

# Gosu::Song 은 pitch(speed) 기능이 없으므로 사용하지 않습니다.
# 대신에 Gosu::Sample, Gosu::SampleInstance를 사용합니다.
# http://www.rubydoc.info/github/gosu/gosu/Gosu/Sample

  # *.mid (x)
  # *.mp3 - MacOS (o)
  # *.mp3 - Windows (x)
  # *.ogg - Windows (128k) (o)
  # *.ogg - Windows (192k) (x)
  # *.wav (o)

module Audio

  @instance = {}
  @pitch = {}
  @volume = {}

  module_function

  def bgm_play(filename, volume=100, pitch=100)
    volume = [[0, volume].max, 100].min
    if @bgm_name == filename
      self.bgm_volume = volume
      self.bgm_pitch = pitch
      return
    end
    bgm_stop
    song = Gosu::Sample.new(FileManager.path("audios/bgm/#{filename}"))
    @volume[:bgm] = volume
    @pitch[:bgm] = pitch
    #play(volume = 1, speed = 1, looping = false) => SampleInstance
    @instance[:bgm] = song.play(@volume[:bgm] * 0.01, @pitch[:bgm] * 0.01, true)
    @bgm_name = filename
  end

  def bgm_stop # 정지
    if @instance[:bgm].is_a?(Gosu::SampleInstance)
      @instance[:bgm].stop
      @bgm_name       = nil
      @volume[:bgm]   = nil
      @pitch[:bgm]    = nil
      @instance[:bgm] = nil
    end
  end

  def bgm_resume # 이어서 재생
    if @instance[:bgm].is_a?(Gosu::SampleInstance)
      @instance[:bgm].resume
    end
  end

  def bgm_pause # 일시 정지
    if @instance[:bgm].is_a?(Gosu::SampleInstance)
      @instance[:bgm].pause
    end
  end

  def bgm_playing? # 재생중?
    if @instance[:bgm].is_a?(Gosu::SampleInstance)
      @instance[:bgm].playing?
    end
  end

  def bgm_paused? # 일시정지됨?
    if @instance[:bgm].is_a?(Gosu::SampleInstance)
      @instance[:bgm].paused?
    end
  end

  def bgm_pitch
    @pitch[:bgm] if @instance[:bgm].is_a?(Gosu::SampleInstance)
  end
  def bgm_pitch=(int) # 피치
    if @instance[:bgm].is_a?(Gosu::SampleInstance)
      @pitch[:bgm] = int
      @instance[:bgm].speed = @pitch[:bgm] * 0.01
    end
  end

  def bgm_volume
    @volume[:bgm] if @instance[:bgm].is_a?(Gosu::SampleInstance)
  end
  def bgm_volume=(int) # 볼륨
    @volume[:bgm] = [[0, int].max, 100].min
    if @instance[:bgm].is_a?(Gosu::SampleInstance)
      @instance[:bgm].volume = @volume[:bgm] * 0.01
    end
  end

  def bgm_fade#(time) # 페이드 (미완성)
    #Gosu.milliseconds
    if @instance[:bgm].is_a?(Gosu::SampleInstance)
      loop do
        sleep 0.1
        self.bgm_volume -= 5
        if self.bgm_volume <= 0
          self.bgm_stop
          break
        end
      end
    end
  end

#=============================================================================

  def bgs_play(filename, volume=100, pitch=100)
    volume = [[0, volume].max, 100].min
    if @bgs_name == filename
      self.bgs_volume = volume
      self.bgs_pitch = pitch
      return
    end
    bgs_stop
    song = Gosu::Sample.new(FileManager.path("audios/bgs/#{filename}"))
    @volume[:bgs] = volume
    @pitch[:bgs] = pitch
    #play(volume = 1, speed = 1, looping = false) => SampleInstance
    @instance[:bgs] = song.play(@volume[:bgs] * 0.01, @pitch[:bgs] * 0.01, true)
    @bgs_name = filename
  end

  def bgs_stop # 정지
    if @instance[:bgs].is_a?(Gosu::SampleInstance)
      @instance[:bgs].stop
      @bgs_name       = nil
      @volume[:bgs]   = nil
      @pitch[:bgs]    = nil
      @instance[:bgs] = nil
    end
  end

  def bgs_resume # 이어서 재생
    if @instance[:bgs].is_a?(Gosu::SampleInstance)
      @instance[:bgs].resume
    end
  end

  def bgs_pause # 일시 정지
    if @instance[:bgs].is_a?(Gosu::SampleInstance)
      @instance[:bgs].pause
    end
  end

  def bgs_playing? # 재생중?
    if @instance[:bgs].is_a?(Gosu::SampleInstance)
      @instance[:bgs].playing?
    end
  end

  def bgs_paused? # 일시정지됨?
    if @instance[:bgs].is_a?(Gosu::SampleInstance)
      @instance[:bgs].paused?
    end
  end

  def bgs_pitch
    @pitch[:bgs] if @instance[:bgs].is_a?(Gosu::SampleInstance)
  end
  def bgs_pitch=(int) # 피치
    if @instance[:bgs].is_a?(Gosu::SampleInstance)
      @pitch[:bgs] = int
      @instance[:bgs].speed = @pitch[:bgs] * 0.01
    end
  end

  def bgs_volume
    @volume[:bgs] if @instance[:bgs].is_a?(Gosu::SampleInstance)
  end
  def bgs_volume=(int) # 볼륨
    @volume[:bgs] = [[0, int].max, 100].min
    if @instance[:bgs].is_a?(Gosu::SampleInstance)
      @instance[:bgs].volume = @volume[:bgs] * 0.01
    end
  end

  def bgs_fade

  end

#=============================================================================

  def me_play(filename, volume=100, pitch=100)
    volume = [[0, volume].max, 100].min
    me_stop
    song = Gosu::Sample.new(FileManager.path("audios/me/#{filename}"))
    @volume[:me] = volume
    @pitch[:me] = pitch
    #play(volume = 1, speed = 1, looping = false) => SampleInstance
    @instance[:me] = song.play(@volume[:me] * 0.01, @pitch[:me] * 0.01, false)
    @me_name = filename
  end

  def me_stop # 정지
    if @instance[:me].is_a?(Gosu::SampleInstance)
      @instance[:me].stop
      @me_name        = nil
      @volume[:me]   = nil
      @pitch[:me]    = nil
      @instance[:me] = nil
    end
  end

  def me_resume # 이어서 재생
    if @instance[:me].is_a?(Gosu::SampleInstance)
      @instance[:me].resume
    end
  end

  def me_pause # 일시 정지
    if @instance[:me].is_a?(Gosu::SampleInstance)
      @instance[:me].pause
    end
  end

  def me_playing? # 재생중?
    if @instance[:me].is_a?(Gosu::SampleInstance)
      @instance[:me].playing?
    end
  end

  def me_paused? # 일시정지됨?
    if @instance[:me].is_a?(Gosu::SampleInstance)
      @instance[:me].paused?
    end
  end

  def me_pitch
    @pitch[:me] if @instance[:me].is_a?(Gosu::SampleInstance)
  end
  def me_pitch=(int) # 피치
    if @instance[:me].is_a?(Gosu::SampleInstance)
      @pitch[:me] = int
      @instance[:me].speed = @pitch[:me] * 0.01
    end
  end

  def me_volume
    @volume[:me] if @instance[:me].is_a?(Gosu::SampleInstance)
  end
  def me_volume=(int) # 볼륨
    @volume[:me] = [[0, int].max, 100].min
    if @instance[:me].is_a?(Gosu::SampleInstance)
      @instance[:me].volume = @volume[:me] * 0.01
    end
  end

  def me_fade

  end

#=============================================================================

  def se_play(filename, volume=100, pitch=100)
    volume = [[0, volume].max, 100].min
    song = Gosu::Sample.new(FileManager.path("audios/se/#{filename}"))
    @volume[:se] = volume
    @pitch[:se] = pitch
    #play(volume = 1, speed = 1, looping = false) => SampleInstance
    @instance[:se] = song.play(@volume[:se] * 0.01, @pitch[:se] * 0.01, false)
    @se_name = filename
  end

  def se_stop # 정지
    if @instance[:se].is_a?(Gosu::SampleInstance)
      @instance[:se].stop
      @se_name       = nil
      @volume[:se]   = nil
      @pitch[:se]    = nil
      @instance[:se] = nil
    end
  end

  def se_resume # 이어서 재생
    if @instance[:se].is_a?(Gosu::SampleInstance)
      @instance[:se].resume
    end
  end

  def se_pause # 일시 정지
    if @instance[:se].is_a?(Gosu::SampleInstance)
      @instance[:se].pause
    end
  end

  def se_playing? # 재생중?
    if @instance[:se].is_a?(Gosu::SampleInstance)
      @instance[:se].playing?
    end
  end

  def se_paused? # 일시정지됨?
    if @instance[:se].is_a?(Gosu::SampleInstance)
      @instance[:se].paused?
    end
  end

  def se_pitch
    @pitch[:se] if @instance[:se].is_a?(Gosu::SampleInstance)
  end
  def se_pitch=(int) # 피치
    if @instance[:se].is_a?(Gosu::SampleInstance)
      @pitch[:se] = int
      @instance[:se].speed = @pitch[:se] * 0.01
    end
  end

  def se_volume
    @volume[:se] if @instance[:se].is_a?(Gosu::SampleInstance)
  end
  def se_volume=(int) # 볼륨
    @volume[:se] = [[0, int].max, 100].min
    if @instance[:se].is_a?(Gosu::SampleInstance)
      @instance[:se].volume = @volume[:se] * 0.01
    end
  end

end