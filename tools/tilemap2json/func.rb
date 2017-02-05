# encoding:utf-8

# 2017.02.02
# 타일맵 파일을 json으로 추출

require 'rubygems'
require 'json'
require "RPG.rb"

def load_data(filename)
	File.open(filename, "rb") { |f|
	  obj = Marshal.load(f)
	}
end

def tilemap2json(map_id=1)
	mapinfo = load_data("Data/Mapinfos.rxdata")
	mapdata = load_data(sprintf("Data/Map%03d.rxdata", map_id))
	
	h =
	{		
		"id" => map_id,
		"name" => mapinfo[map_id].name.force_encoding("UTF-8"),
		"tileset_id" => mapdata.tileset_id,
		"bgm" => {"name" => mapdata.bgm.name, "volume" => mapdata.bgm.volume, "pitch" => mapdata.bgm.pitch},
		"bgs" => {"name" => mapdata.bgs.name, "volume" => mapdata.bgs.volume, "pitch" => mapdata.bgs.pitch},
		"events" => mapdata.events,
		"autoplay_bgm" => mapdata.autoplay_bgm,
		"autoplay_bgs" => mapdata.autoplay_bgs,
		"width" => mapdata.width,
		"height" => mapdata.height,
		"data" => mapdata.data.data,
	}

	filename = sprintf("%03d_", map_id) + mapinfo[map_id].name + "_JSON.txt"

	f = File.open(filename, "wb")
	f.write("[Dirty]\r\n\r\n")
	f.write(h.to_json)
	f.write("\r\n\r\n\r\n")
	f.write("[Clean]\r\n\r\n")
	f.write(JSON.pretty_generate(h))
end

=begin

 [MapInfos.rxdata]
{1=>#<RPG::MapInfo:0x3224fa8 @scroll_x=512, @name="맵1", @expanded=false, @order=1, @scroll_y=384, @parent_id=0>, 
2=>#<RPG::MapInfo:0x3224eb8 @scroll_x=320, @name="맵2", @expanded=true, @order=2, @scroll_y=240, @parent_id=0>, 
3=>#<RPG::MapInfo:0x3224e58 @scroll_x=320, @name="맵3", @expanded=false, @order=3, @scroll_y=240, @parent_id=2>}

 [Map001.rxdata]

#<RPG::Map:0x3224fc0 
	@bgm=#<RPG::AudioFile:0x3224f48 @volume=100, @name="", @pitch=100>,
	@events={},
	@tileset_id=1,
	@bgs=#<RPG::AudioFile:0x3224e40 @volume=80, @name="", @pitch=100>,
	@autoplay_bgm=false,
	@data=#<Table:0x3224d98>,
	@autoplay_bgs=false,
	@height=24,
	@encounter_step=30,
	@width=32,
	@encounter_list=[]
>

=end