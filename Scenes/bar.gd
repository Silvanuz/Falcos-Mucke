extends Node2D

var note_scn = preload("res://Scenes/note.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var notes_data =[
#	{
#		"pos": 300,
#		#"len": 100
#	},
#
#	{
#		"pos": 400,
#		#"len": 100
#	},
#
#	{
#		"pos": 800,
#		#"len": 100
#	},
#
#	{
#		"pos": 1200,
#		#"len": 100
#	}
#
#]



var note_scale #= 1 #Wahrsch nur für 3D wichtig
var bar_data
# Called when the node enters the scene tree for the first time.
func _ready():
	add_notes()

func add_notes():
	var line = 1 
	for line_data in bar_data:
		var notes_data = line_data.notes
		for note_data in notes_data:
			var note = note_scn.instance()
			note.line = line
			note.position_note = int(note_data.pos)*note_scale
			add_child(note)
		line += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
