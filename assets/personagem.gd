extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
const GRAVIDADE = 20
const SPEED = 600
const JUMP_HEIGHT = -550
var atacando = false;


func _process(delta):
	motion.y += GRAVIDADE
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$sprite.play("correr")
		#para flipar viraro personagemao outro lado
		$sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$sprite.play("correr")
		$sprite.flip_h = true
	else:
		motion.x = 0
		$sprite.play("parado")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			
		if Input.is_action_pressed("atacar"):
			$sprite.play("ataque")
			#print("ataque!")
			$atack/CollisionShape2D.disabled = false
			atacando = true
		elif !Input.is_action_just_pressed("atacar"):
			$atack/CollisionShape2D.disabled = true
		
	else:
		$sprite.play("pular")
	
	motion = move_and_slide(motion, UP)


func _on_sprite_animation_finished():
	if $sprite.animation == "Slash":
		$atack/CollisionShape2D.disabled = false;
		atacando = false
		 # Replace with function body.
