extends Node2D

var bar_scn = preload("res://Scenes/bar_enemy.tscn")

var test
var bars = []
onready var bars_node = $Barsnode
var curr_location
var bar_length_in_m
var speed = 0.1
var note_scale
var curr_bar_index
var tracks_data
var setup_done
# Called when the node enters the scene tree for the first time.
#func _ready():
#	for i in range(2):
#		add_bar()

func setup(game):
	speed = Vector2(game.speed,0)
	bar_length_in_m = game.bar_length_in_m
	curr_location = Vector2(bar_length_in_m+75,100)
	note_scale = game.note_scale
	curr_bar_index = 0
	tracks_data = game.map.tracks
	add_bars()
	setup_done = true

func _process(delta):
	
	if setup_done:
		bars_node.position -= speed*delta
	
		for bar in bars:
			test = bar.position
			if bar.position.x + bars_node.position.x < -bar_length_in_m:
				remove_bar(bar)
				add_bar()
			else:
				pass

func add_bar():

	var bar = bar_scn.instance()
	bar.position = Vector2(curr_location.x, curr_location.y)
	bar.bar_data = get_bar_data()
	bar.note_scale = note_scale
	bars.append(bar)
	bars_node.add_child(bar)
	curr_location += Vector2(bar_length_in_m, 0)
	curr_bar_index += 1

func get_bar_data():
	var left_data = tracks_data[0].bars[curr_bar_index]
	#var center_data = tracks_data[1].bars[curr_bar_index]
	#var right_data = tracks_data[2].bars[curr_bar_index]
	return  [left_data]
func remove_bar(bar):
	bar.queue_free()
	bars.erase(bar)

func add_bars():
	for i in range(4):
		add_bar()
