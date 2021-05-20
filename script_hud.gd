extends Node2D

var tempo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground/txt_tempo.text = "%02d" % tempo #str(tempo)


func incrementa_tempo():
	tempo += 1
