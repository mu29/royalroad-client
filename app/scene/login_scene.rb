class LoginScene < Scene
  def initialize
    Audio.bgm_play("013-Theme02.ogg", 100)
    Server.init
  end

  def enter
  end

  def leave
  end

  def update
    Server.update
  end

  def draw
  end

  def button_down(id)
    case id
    when Gosu::KbA
      Audio.se_play("007-System07.ogg")
      Packet.send("sending number #{rand}")
    when Gosu::KbN
      Audio.se_play("002-System02.ogg")
      @play_scene = PlayScene.new
      Scene.switch(@play_scene)
    when Gosu::KbX
      Audio.me_play("002-Victory02.wav")
    end
  end
end