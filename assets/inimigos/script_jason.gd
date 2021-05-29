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
	$detectaPersonagem2.enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movimento.y += ScriptGlobal.GRAVIDADE
	$DetectorParedeDir.enabled = true
	$DetectorParedeEsq.enabled = true
	
	if $DetectorParedeEsq.is_colliding():
		movimento.x *= -1
		$AnimatedSprite.flip_h = true
		
		$detectaPersonagem.enabled = false
		$detectaPersonagem2.enabled = true

	elif $DetectorParedeDir.is_colliding():
		movimento.x *= -1
		$AnimatedSprite.flip_h = false
		
		$detectaPersonagem2.enabled = false
		$detectaPersonagem.enabled = true
		
		
	#Detecta personagem e vira inimigo
	if $detectaPersonagem.is_colliding():
		if(not $AnimatedSprite.flip_h):
			movimento.x *= -1
			$AnimatedSprite.flip_h = true
			$detectaPersonagem.enabled = false
			$detectaPersonagem2.enabled = true
			
		elif($AnimatedSprite.flip_h):
			movimento.x *= -1
			$AnimatedSprite.flip_h = false
			
	if $detectaPersonagem2.is_colliding():
		if($AnimatedSprite.flip_h):
			movimento.x *= -1
			$AnimatedSprite.flip_h = false
			$detectaPersonagem2.enabled = false
			$detectaPersonagem.enabled = true
			
		elif(not $AnimatedSprite.flip_h):
			movimento.x *= -1
			$AnimatedSprite.flip_h = true
	
	movimento.y = move_and_slide(movimento, UP).y
