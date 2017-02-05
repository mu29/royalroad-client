class LoginScene < Scene
  def initialize
    Audio.bgm_play("013-Theme02.ogg", 80, 120)
    Audio.bgs_play("007-Rain03.ogg")
    #Audio.bgm_fade
  end

  def enter
  end

  def leave
  end

  def draw
  end

  def button_down(id)
    case id
    when Gosu::KbN
      Audio.se_play("002-System02.ogg")
      @play_scene = PlayScene.new
      Scene.switch(@play_scene)
    when Gosu::KbX
      Audio.me_play("002-Victory02.wav")
    when Gosu::KbZ
      Audio.se_play("007-System07.ogg")
    end
  end
end
