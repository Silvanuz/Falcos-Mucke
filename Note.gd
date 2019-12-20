extends Node2D
export (int,1,3) var line
var position_note = 0
var is_colliding = true
var picker
var collected = false
var is_op
var offset = 80
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
	match line:
		1:
			self.position.y = 0
		2:
			self.position.y = offset*1
		3:
			self.position.y = offset*2
		4:
			self.position.y = offset*3
		5:
			self.position.y = offset*4
		6:
			self.position.y = offset*5
		7:
			self.position.y = offset*6
		8:
			self.position.y = offset*7
		9:
			self.position.y = offset*8
		10:
			self.position.y = offset*9

	

	
func collect():
	if not collected:
		if is_colliding and picker:
			if picker.is_collecting or is_op:
				
				collected = true
				picker.is_collecting = false
				hide()
				var picker_line
				
				#Stellt eine Verbindung mit unserem Signal_Collector im Hauptverzeichnis her
				var signal_collector = get_parent().get_parent().get_parent().get_parent().get_node("Signal_Collector")
				signal_collector.note_counter += 1
				
				#Es wird geguckt welcher Picker gerade angeschlagen hat
				picker_line = picker.line
				
				#Hier wird geschaut welcher Picker angeschlagen hat
				# 2 u. 4 Sind der Spieler. 
				# 22 ist wenn 2 verpasst hat
				# 44 ist wenn 4 verpasst hat
				# Rest spielt automatisch
				match picker_line:
					1:
						signal_collector.signal_line1 += 1
					2:
						signal_collector.signal_line2 += 1
					3:
						signal_collector.signal_line3 += 1
					4:
						signal_collector.signal_line4 += 1
					5:
						signal_collector.signal_line5 += 1
					6:
						signal_collector.signal_line6 += 1
					7:
						signal_collector.signal_line7 += 1
					8:
						signal_collector.signal_line8 += 1
					9:
						signal_collector.signal_line9 += 1
					10:
						signal_collector.signal_line10 += 1
					22:
						signal_collector.signal_line22 += 1
					44:
						signal_collector.signal_line44 += 1
				
				

func _on_Area2D_area_entered(area):
	picker = area.get_parent()
	if area.is_in_group("picker"):
		is_colliding = true		
		is_op = picker.is_op
			

func _on_Area2D_area_exited(area):
	if area.is_in_group("picker"):
		is_colliding = false
