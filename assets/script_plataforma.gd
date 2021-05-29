extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Path2D/PathFollow2D.unit_offset =0

var velocidade = 0.3
var para_frente = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset = 0
	if (para_frente):
		offset = $Path2D/PathFollow2D.unit_offset + velocidade * delta
	else:
		offset = $Path2D/PathFollow2D.unit_offset - velocidade * delta
		
	if (offset>1):
		para_frente = false
	elif (offset<0):
		para_frente = true
		
	if (para_frente):
		$Path2D/PathFollow2D.unit_offset += velocidade * delta
	else:
		$Path2D/PathFollow2D.unit_offset -= velocidade * delta

