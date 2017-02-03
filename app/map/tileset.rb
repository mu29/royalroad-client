class Tileset
  attr_reader :image
  attr_reader :priorities

	def initialize(tileset_id)
		begin
			# /resources/tilesets/*.json
			hash_data = Cache.load_tileset_json(tileset_id)
			map_instance_variables(hash_data)
			@image = Cache.tileset("#{@tileset_name}.png")
		rescue Errno::ENOENT => e
			p e
			@id = 0
			@name = ""
			@tileset_name = ""
			@autotile_names = [""] * 7
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
			@passages = Array.new(384)
			@priorities = Array.new(384)
			@priorities[0] = 5
			@terrain_tags = Array.new(384)
		end
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