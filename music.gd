extends Node2D

var audio = preload("res://arena.ogg")
onready var player = $AudioStreamPlayer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed
var started 
var pre_start_duration
var start_pos_in_sec
var setup_done

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func setup(game):
	player.stream = game.audio
	speed = game.speed
	started = false
	pre_start_duration = game.bar_length_in_m
	start_pos_in_sec = game.start_pos_in_sec
	setup_done = true
	
func start():
	started = true
	player.play(start_pos_in_sec)
	
func _process(delta):
	if setup_done:
		if not started:
			pre_start_duration -= speed*delta
			if pre_start_duration <= 0:
				start()
				return
		pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
