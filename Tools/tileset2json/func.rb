# encoding : utf-8

# 2017.02.01
# 타일셋 파일을 json으로 추출

require 'rubygems'
require 'json'
require "RPG.rb"

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
	    "name" => data.name.force_encoding("UTF-8"),
	    "tileset_name" => data.tileset_name.force_encoding("UTF-8"),
	    "autotile_names" => data.autotile_names.collect {|x| x = x.force_encoding("UTF-8") },
	    "panorama_name" => data.panorama_name.force_encoding("UTF-8"),
	    "panorama_hue" => data.panorama_hue,
	    "fog_name" => data.fog_name.force_encoding("UTF-8"),
	    "fog_hue" => data.fog_hue,
	    "fog_opacity" => data.fog_opacity,
	    "fog_blend_type" => data.fog_blend_type,
	    "fog_zoom" => data.fog_zoom,
	    "fog_sx" => data.fog_sx,
	    "fog_sy" => data.fog_sy,
	    "battleback_name" => data.battleback_name.force_encoding("UTF-8"),
	    "passages" => data.passages.data,#table2hash(data.passages),
    	"priorities" => data.priorities.data,#table2hash(data.priorities),
    	"terrain_tags" => data.terrain_tags.data,#table2hash(data.terrain_tags),
	 }

   filename = sprintf("%03d_", data.id) + data.name + "_JSON.txt"

	 f = File.open(filename, "wb")
	 f.write("[Dirty]\r\n\r\n")
	 f.write(h.to_json)
	 f.write("\r\n\r\n\r\n")
	 f.write("[Clean]\r\n\r\n")
	 f.write(JSON.pretty_generate(h))

end