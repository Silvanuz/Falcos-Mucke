extends Node2D
var audio
var audio_file1 = "res://arena.ogg"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var music_node = $music
onready var road_node = $Road
var mapfile1 = "res://Maps/song1.mboy"

var map
var tempo
var bar_length_in_m
var quarter_time_in_sec
var speed
var note_scale
var start_pos_in_sec

# Called when the node enters the scene tree for the first time.
func _ready():
	audio = load(audio_file1)
	map = load_map()
	calc_params()
	music_node.setup(self)
	road_node.setup(self)
	
func calc_params():
	tempo = int(map.tempo)
	bar_length_in_m = 750
	quarter_time_in_sec = 60/float(tempo)
	speed = bar_length_in_m/float(4*quarter_time_in_sec)
	note_scale = bar_length_in_m/float(4*400)
	start_pos_in_sec = (float(map.start_pos)/400.0) * quarter_time_in_sec

func load_map():
	var file = File.new()
	file.open(mapfile1, File.READ)
	var content = file.get_as_text()
	file.close()
	return JSON.parse(content).get_result()
