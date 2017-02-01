require "zlib"
require 'rubygems'
require 'json'

# The multidimensional array class. Each element is an integer of 2 signed bytes ranging from -32,768 to 32,767.
#
# Ruby's Array class does not run efficiently when handling large amounts of data, hence the inclusion of this class.

class Table
  attr_reader :xsize, :ysize, :zsize, :data

  # Creates a Table object. Specifies the size of each dimension in the multidimensional array. 1-, 2-, and 3-dimensional arrays are possible. Arrays with no parameters are also permitted.

  def initialize(xsize, ysize=1, zsize=1)
    @xsize = xsize
    @ysize = ysize
    @zsize = zsize
    @data  = Array.new(@xsize*@ysize*@zsize, 0)
  end

  # Changes the size of the array. All data from before the size change is retained.

  def resize(xsize, ysize=1, zsize=1)

  end

  # :call-seq:
  # self[x]
  # self[x, y]
  # self[x, y, z]
  #
  # Accesses the array's elements. Pulls the same number of arguments as there are dimensions in the created array. Returns nil if the specified element does not exist.

  def [](x, y=0, z=0)
    return nil if x >= @xsize or y >= @ysize
    @data[x + y * @xsize + z * @xsize * @ysize]
  end

  def []=(x, y=0, z=0, v) #:nodoc:
    @data[x + y * @xsize + z * @xsize * @ysize]=v
  end

  def self._load(s) #:nodoc:
    Table.new(1).instance_eval {
      @size, @xsize, @ysize, @zsize, xx, *@data = s.unpack('LLLLLS*')
      self
    }
  end

  def _dump(d = 0) #:nodoc:
    [@size, @xsize, @ysize, @zsize, @xsize*@ysize*@zsize, *@data].pack('LLLLLS*')
  end
end


module RPG
  class Tileset
    def initialize
      @id = 0
      @name = ""
      @tileset_name = ""
      @autotile_names = [""]*7
      @panorama_name = ""
      @panorama_hue = 0
      @fog_name = ""
      @fog_hue = 0
      @fog_opacity = 64
      @fog_blend_type = 0
      @fog_zoom = 200
      @fog_sx = 0
      @fog_sy = 0
      @battleback_name = ""
      @passages = Table.new(384)
      @priorities = Table.new(384)
      @priorities[0] = 5
      @terrain_tags = Table.new(384)
    end
    attr_accessor :id
    attr_accessor :name
    attr_accessor :tileset_name
    attr_accessor :autotile_names
    attr_accessor :panorama_name
    attr_accessor :panorama_hue
    attr_accessor :fog_name
    attr_accessor :fog_hue
    attr_accessor :fog_opacity
    attr_accessor :fog_blend_type
    attr_accessor :fog_zoom
    attr_accessor :fog_sx
    attr_accessor :fog_sy
    attr_accessor :battleback_name
    attr_accessor :passages
    attr_accessor :priorities
    attr_accessor :terrain_tags
  end
end


def load_data(filename)
	File.open(filename, "rb") { |f|
	  obj = Marshal.load(f)
	}
end

def table2hash(table)
	hash = 
	{
		#{}"xsize" => table.xsize,
		#{}"ysize" => table.ysize,
		#{}"zsize" => table.zsize,
		"data" => table.data,
	}
	return hash
end

def tilesets2json(id=1)
	data = load_data("Data/Tilesets.rxdata")[id]
	 h = 
	 {
	 	"id" => data.id,
	    "name" => data.name,
	    "tileset_name" => data.tileset_name,
	    "autotile_names" => data.autotile_names,
	    "panorama_name" => data.panorama_name,
	    "panorama_hue" => data.panorama_hue,
	    "fog_name" => data.fog_name,
	    "fog_hue" => data.fog_hue,
	    "fog_opacity" => data.fog_opacity,
	    "fog_blend_type" => data.fog_blend_type,
	    "fog_zoom" => data.fog_zoom,
	    "fog_sx" => data.fog_sx,
	    "fog_sy" => data.fog_sy,
	    "battleback_name" => data.battleback_name,
	    "passages" => data.passages.data,#table2hash(data.passages),
    	"priorities" => data.priorities.data,#table2hash(data.priorities),
    	"terrain_tags" => data.terrain_tags.data,#table2hash(data.terrain_tags),
	 }

	 f = File.open(	sprintf("%03d_", data.id) + data.name + "_JSON.txt", "wb")
	 f.write("[Dirty]\r\n\r\n")
	 f.write(h.to_json)
	 f.write("\r\n\r\n\r\n")
	 f.write("[Clean]\r\n\r\n")
	 f.write(JSON.pretty_generate(h))

end