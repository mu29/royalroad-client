# encoding : utf-8

$:.unshift Dir.pwd
require "func.rb"

3.times do |id|
	tilemap2json(id+1)
end