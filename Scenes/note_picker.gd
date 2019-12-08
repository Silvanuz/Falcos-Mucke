extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int, 1,3) var line
export (bool) var is_op

var is_pressed = false
var is_collecting = false
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	match line:
		#Eig brauchen wir nur einen
		1:
			if event.is_action_pressed("ui_left"):
				is_pressed = true
				is_collecting = true
			elif event.is_action_released("ui_left"):
				is_pressed = false
				is_collecting = false
#		2:
#			if event.is_action_pressed("ui_down"):
#				is_pressed = true
#			elif event.is_action_released("ui_down"):
#				is_pressed = false
#		3:
#			if event.is_action_pressed("ui_right"):
#				is_pressed = true
#			elif event.is_action_released("ui_right"):
#				is_pressed = false


func _process(delta):
	if is_pressed:
		$notepicker.scale.x = 0.8
		$notepicker.scale.y = 0.8
	else:
		$notepicker.scale.x = 1
		$notepicker.scale.y = 1
