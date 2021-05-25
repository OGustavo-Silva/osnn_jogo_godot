extends KinematicBody2D

var flip = true
var posicao_inicial = true
var posicao_final = true
var velocidade = 80
const UP = Vector2(0, -1)
var movimento = Vector2.ZERO
var vida = 3

func _ready():
	$sprite.play("andar")
	set_physics_process(false)
	movimento.x = -velocidade
	
func _process(delta):
	movimento.y += ScriptGlobal.GRAVIDADE
	#movimento.x -= velocidade
	
	if $DetectorParedeEsq.is_colliding():
		movimento.x *= -1
		$sprite.flip_h = true
	elif $DetectorParedeDir.is_colliding():
		movimento.x *= -1
		$sprite.flip_h = false
	
	movimento.y = move_and_slide(movimento, UP).y
	
func dano():
	vida -=1
	if $sprite.flip_h:
		position.x = position.x - 30
	else:
		position.x = position.x + 30
	if vida <1:
		queue_free()
