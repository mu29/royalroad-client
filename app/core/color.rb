# 2017.02.04
# http://www.rubydoc.info/github/gosu/gosu/Gosu/Color
=begin


  c = Color.new(16, 32, 48, 255)
  p c
  c.set(50, 100, 150)
  p c
  c.set(Color.new(64, 96, 128, 128))
  p c
  c.alpha = 64
  p c

  c1 = Color.new
  c2 = Color.new

  p c1 == c2
  p c1 === c2
  p c1.eql?(c2)
=end

class Color

  def initialize(*args)
    if args.size == 1
    elsif args.size >= 3 && args.size <= 4
      args[3] = 255 if args.size == 3
    else
      args = [0, 0, 0, 255]
    end
    @gosu_color = Gosu::Color.rgba(*args)
  end

  def set(*args)
    if args.size == 1
      if args[0].is_a?(Numeric)
        @gosu_color = Gosu::Color.rgba(*args)
      elsif args[0].is_a?(Color)
        color = args[0]
        @gosu_color = Gosu::Color.new(color.alpha, color.red, color.green, color.blue)
      end
    elsif args.size >= 3 && args.size <= 4
      args[3] = 255 if args.size == 3
      @gosu_color = Gosu::Color.rgba(*args)
    else
      args = [0, 0, 0, 255]
      @gosu_color = Gosu::Color.rgba(*args)
    end
  end

  def gosu #<Gosu::Color:ARGB=0xAA_RRGGBB>
    @gosu_color
  end

  def red
    @gosu_color.red
  end

  def green
    @gosu_color.green
  end

  def blue
    @gosu_color.blue
  end

  def alpha
    @gosu_color.alpha
  end

  def red=(int)
    if int.is_a?(Numeric)
      int = [[0, int].max, 255].min
      color = @gosu_color
      args = [color.alpha, int, color.green, color.blue]
      @gosu_color = Gosu::Color.argb(*args)
    end
  end

  def green=(int)
    if int.is_a?(Numeric)
      int = [[0, int].max, 255].min
      color = @gosu_color
      args = [color.alpha, color.red, int, color.blue]
      @gosu_color = Gosu::Color.argb(*args)
    end
  end

  def blue=(int)
    if int.is_a?(Numeric)
      int = [[0, int].max, 255].min
      color = @gosu_color
      args = [color.alpha, color.red, color.green, int]
      @gosu_color = Gosu::Color.argb(*args)
    end
  end

  def alpha=(int)
    if int.is_a?(Numeric)
      int = [[0, int].max, 255].min
      color = @gosu_color
      args = [int, color.red, color.green, color.blue]
      @gosu_color = Gosu::Color.argb(*args)
    end
  end

  def to_s
    "(#{red()}, #{green()}, #{blue()}, #{alpha()})"
  end

  def ==(other)
    raise TypeError.new("can't convert #{other.class} into Color") if self.class != other.class
    return self.red == other.red &&
        self.green == other.green &&
        self.blue == other.blue &&
        self.alpha == other.alpha
  end

  alias :=== :==
  alias :eql? :==

end