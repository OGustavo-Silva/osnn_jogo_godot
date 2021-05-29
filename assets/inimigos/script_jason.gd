extends KinematicBody2D

var velocidade = 90
const UP = Vector2(0, -1)
var movimento = Vector2.ZERO
var vida = 3
var flip = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("andando")
	movimento.x -= velocidade


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movimento.y += ScriptGlobal.GRAVIDADE
	
	
	if $DetectorParedeEsq.is_colliding():
		movimento.x *= -1
		$AnimatedSprite.flip_h = true
	elif $DetectorParedeDir.is_colliding():
		movimento.x *= -1
		$AnimatedSprite.flip_h = false
		
	#Detecta personagem e vira inimigo
	if $detectaPersonagem.is_colliding() and $AnimatedSprite.flip_h:
		movimento.x *= -1
		$AnimatedSprite.flip_h = false
		print("personagem esq")
	
	elif$detectaPersonagem2.is_colliding() and not ($AnimatedSprite.flip_h):
		movimento.x *= -1
		$AnimatedSprite.flip_h = true
		print("persongam dir")
	
	movimento.y = move_and_slide(movimento, UP).y
