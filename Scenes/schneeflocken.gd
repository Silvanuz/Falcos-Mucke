extends Particles2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	var signal_collector = get_parent().get_parent().get_node("Player_Konfig").get_node("Signal_Collector")
	if signal_collector.note_counter > 0 and signal_collector.note_counter < 2 :
		amount = 100
