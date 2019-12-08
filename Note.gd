extends Node2D

export (int,1,3) var line
var position_note = 0
var is_colliding = true
var picker
var collected = false
var is_op
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_note_position();

func _process(delta):
	collect()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_note_position():
	self.position.x = position_note
	var x
	match line:
		1:
			x = -1

	

	
func collect():
	if not collected:
		if is_colliding and picker:
			if picker.is_collecting or is_op:
				collected = true
				picker.is_collecting = false
				hide()

func _on_Area2D_area_entered(area):
	if area.is_in_group("picker"):
		is_colliding = true
		picker = area.get_parent()
		is_op = picker.is_op

func _on_Area2D_area_exited(area):
	if area.is_in_group("picker"):
		is_colliding = false
