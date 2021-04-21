extends KinematicBody2D

const UP = Vector2(0, -1)
var movimento = Vector2()
const VELOCIDADE = 600
var atacando = false;
var vida = 3


func _process(delta):
	movimento.y += ScriptGlobal.GRAVIDADE
	
	if Input.is_action_pressed("ui_right"):
		movimento.x = VELOCIDADE
		scale.x = scale.y * 1 #Para flipar todo personagem
		$sprite.play("correr")

	elif Input.is_action_pressed("ui_left"):
		movimento.x = -VELOCIDADE
		scale.x = scale.y * -1
		$sprite.play("correr")
		
	else:
		movimento.x = 0
		$sprite.play("parado")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			movimento.y = ScriptGlobal.ALTURA_PULO
			
		if Input.is_action_pressed("atacar"):
			$sprite.play("ataque")
			#print("ataque!")
			$atack/CollisionShape2D.disabled = false
			atacando = true
		elif !Input.is_action_just_pressed("atacar"):
			$atack/CollisionShape2D.disabled = true
		
	else:
		$sprite.play("pular")
	
	movimento = move_and_slide(movimento, UP)


func _on_sprite_animation_finished():
	if $sprite.animation == "Slash":
		$atack/CollisionShape2D.disabled = false;
		atacando = false
		 # Replace with function body.


func _on_atack_body_entered(body):
	body.dano()


func _on_dano_body_entered(body):
	
	
	print(body)
	print(vida)
	if vida == 0:
		$".".queue_free();
		
