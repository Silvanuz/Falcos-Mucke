extends Node

#Dieses Objekt muss für jedes Minigame einzigartig gemacht werden
#Der aufbau ist immer derselbe - Nur die Signalverarbeitung ist logischerweise immer anders

var punkte = 0

export (int) var game_number
export (int) var note_counter 

export (int) var signal_line1
export (int) var signal_line2
export (int) var signal_line3
export (int) var signal_line4
export (int) var signal_line5
export (int) var signal_line6
export (int) var signal_line7
export (int) var signal_line8
export (int) var signal_line9
export (int) var signal_line10
export (int) var signal_line22
export (int) var signal_line44

var signal_last_note_counter = 0
var signal_last_line1 = 0
var signal_last_line2 = 0
var signal_last_line3 = 0
var signal_last_line4 = 0
var signal_last_line5 = 0
var signal_last_line6 = 0
var signal_last_line7 = 0
var signal_last_line8 = 0
var signal_last_line9 = 0
var signal_last_line10 = 0
var signal_last_line22 = 0
var signal_last_line44 = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$label_punkte.set_text("Punkte:   " + str(punkte))
	#Die Events werden ausgelößt immer wenn sich das Signal verändert
	
	#Beispiel: Signal_Line2 ist momentan bei 3, trifft der Spieler die Note, steigt diese um 1 - also auf 4
	#Da das letzte bekannte signal "signal_last_line2" aber vorher 3 war, ist die bedingung nun wahr da
	# 3 ungleich 4 ist. Nun wird die bedingung ausgeführt und signal_last_line2 wird auf 4 gesetzt.
	#Sobald wieder getroffen wird und es auf 5 steigt ...repeat
	
	#Durch dieses Verfahren fragen wir quasi eine "positive Flanke" ab
	#So ist gewährleistet, dass die Bedingung nur EINMAL durchgegangen wird, damit die Animation auch nur einmmal
	#abgespielt wird
	
	#Immer wenn eine Neue Note hochgezählt wird gibts eine Schneeflocke mehr
	if note_counter != signal_last_note_counter:
		signal_last_note_counter = note_counter
		var schneeflocken = get_parent().get_parent().get_node("Levelobjekte/particle_schneeflocken")
		if note_counter == 10:
			schneeflocken.amount = 10
		if note_counter == 20:
			schneeflocken.amount = 40
		if note_counter == 33:
			schneeflocken.amount = 70
		if note_counter == 44:
			schneeflocken.amount = 100
		if note_counter == 55:
			schneeflocken.amount = 120
		if note_counter == 68:
			schneeflocken.amount = 150
		if note_counter == 79:
			schneeflocken.amount = 180
		if note_counter == 92:
			schneeflocken.amount = 210
		if note_counter == 105:
			schneeflocken.amount = 240
		if note_counter == 120:
			schneeflocken.amount = 270
		if note_counter == 137:
			schneeflocken.amount = 360
		if note_counter == 154:
			schneeflocken.speed_scale = 1.6
		if note_counter == 170:
			schneeflocken.speed_scale = 2.5
		if note_counter == 189:
			schneeflocken.speed_scale = 3.5
		if note_counter == 208:
			schneeflocken.speed_scale = 5.0
		if note_counter == 226:
			schneeflocken.speed_scale = 1
		if note_counter == 242:
			schneeflocken.speed_scale = 0.4
		if note_counter == 259:
			schneeflocken.speed_scale = 0.1
		if note_counter == 278:
			schneeflocken.speed_scale = 0.0
		if note_counter == 297:
			schneeflocken.speed_scale = 0.5
		if note_counter == 217:
			schneeflocken.speed_scale = 0.8
	if signal_line1 != signal_last_line1:
		signal_last_line1 = signal_line1
		var gegner_node = get_parent().get_parent().get_node("Levelobjekte/Gegner/animplayer_gegner")
		gegner_node.play("links")

	
	if signal_line2 != signal_last_line2:
		signal_last_line2 = signal_line2
		var spieler_node = get_parent().get_parent().get_node("Levelobjekte/Spieler/animplayer_spieler")
		spieler_node.play("links")
		punkte += 1

	if signal_line3 != signal_last_line3:
		signal_last_line3 = signal_line3
		var gegner_node = get_parent().get_parent().get_node("Levelobjekte/Gegner/animplayer_gegner")
		gegner_node.play("rechts")

		
	if signal_line4 != signal_last_line4:
		signal_last_line4 = signal_line4
		var spieler_node = get_parent().get_parent().get_node("Levelobjekte/Spieler/animplayer_spieler")
		spieler_node.play("rechts")
		punkte += 1
		
	if signal_line5 != signal_last_line5:
		signal_last_line5 = signal_line5
		#Holt sich das animationsnode der Stöcker
		var stoecker_node = get_parent().get_parent().get_node("Levelobjekte/Stoecker/animplayer_stoecker")
		#Spielt bei jedem Hit die Animation
		stoecker_node.play("stoecker")

	
	if signal_line6 != signal_last_line6:
		signal_last_line6 = signal_line6
		#Holt sich das animationsnode des Basses
		var bass_node = get_parent().get_parent().get_node("Levelobjekte/Bass/animplayer_bass")
		#Spielt bei jedem Hit die Animation
		bass_node.play("bass")

	
	if signal_line7 != signal_last_line7:
		signal_last_line7 = signal_line7


	if signal_line8 != signal_last_line8:
		signal_last_line8 = signal_line8

		
	if signal_line1 != signal_last_line1:
		signal_last_line9 = signal_line9

		
	if signal_line1 != signal_last_line1:
		signal_last_line10 = signal_line10


	if signal_line22 != signal_last_line22:
		signal_last_line22 = signal_line22
		var spieler_node = get_parent().get_parent().get_node("Levelobjekte/Spieler/animplayer_spieler")
		spieler_node.play("links_falsch")
		punkte -= 1
		
	if signal_line44 != signal_last_line44:
		signal_last_line44 = signal_line44
		var spieler_node = get_parent().get_parent().get_node("Levelobjekte/Spieler/animplayer_spieler")
		spieler_node.play("rechts_falsch")
		punkte -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
