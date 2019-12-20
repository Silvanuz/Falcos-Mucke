extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int, 1,44) var line
export (bool) var is_op
var is_pressed = false
var is_collecting = false
var note_is_here_2 = false
var note_is_here_4 = false
var note
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	match line:

		2:
			if event.is_action_pressed("ui_left") and note_is_here_2:
				is_pressed = true
				is_collecting = true
			#Falls keine note da ist, wir aber trotzdem drücken, geben wir das falsch signal	
			elif event.is_action_pressed("ui_left") and not note_is_here_2:
				var signal_collector = get_parent().get_parent().get_node("Signal_Collector")
				signal_collector.signal_line22 += 1
			
			elif event.is_action_released("ui_left"):
				is_pressed = false
				is_collecting = false
		4:
			if event.is_action_pressed("ui_right") and note_is_here_4 :
				is_pressed = true
				is_collecting = true
			elif event.is_action_pressed("ui_right") and not note_is_here_4:
				var signal_collector = get_parent().get_parent().get_node("Signal_Collector")
				signal_collector.signal_line44 += 1
				
			elif event.is_action_released("ui_right"):
				is_pressed = false
				is_collecting = false
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


#Hier wird abgefragt ob überhaupt eine Note in unserer Reichweite ist
#Je nachdem setzen wir das Zeichen ob eine Note da ist

func _on_Area2D_area_entered(area):
	note = area.get_parent()
	if area.is_in_group("note") and note.line == 2:
		note_is_here_2 = true
	if area.is_in_group("note") and note.line == 4:
		note_is_here_4 = true


func _on_Area2D_area_exited(area):
	note = area.get_parent()
	if area.is_in_group("note") and note.line == 2:
		note_is_here_2 = false
	if area.is_in_group("note") and note.line == 4:
		note_is_here_4 = false

