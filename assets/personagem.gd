extends KinematicBody2D

const UP = Vector2(0, -1)
var movimento = Vector2()
const VELOCIDADE = 600
var atacando = false;

func _process(delta):
	movimento.y += ScriptGlobal.GRAVIDADE
	
	if Input.is_action_pressed("ui_right"):
		movimento.x = VELOCIDADE
		scale.x = scale.y * 1 #Para flipar todo personagem
		$sprite.play("correr")
		$atack/CollisionShape2D.disabled = true

	elif Input.is_action_pressed("ui_left"):
		movimento.x = -VELOCIDADE
		scale.x = scale.y * -1
		$sprite.play("correr")
		$atack/CollisionShape2D.disabled = true
		
	#Impede que resete o frame a cada frame( resolve o problema de ficar apenas no frame 1 quando ataca)
	elif($sprite.is_playing() and ($sprite.animation == "ataque_basico" or $sprite.animation=="ataque")):
		$atack/CollisionShape2D.disabled = false
		atacando = true
		
	else:
		movimento.x = 0
		$sprite.play("parado")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			$atack/CollisionShape2D.disabled = true
			movimento.y = ScriptGlobal.ALTURA_PULO
	else:
		$sprite.play("pular")
		
	#Ataque rapido
	if Input.is_action_just_pressed("atacar"):
			$sprite.play("ataque_basico")
			$atack/CollisionShape2D.disabled = false
			atacando = true
			$sprite.animation = "ataque_basico"#usado para impedir o problema de rodar apenas o frame 1 da animacao(ver comeco do codigo)
			
	#Ataque longo
	if Input.is_action_just_pressed("atacar2"):
		$sprite.play("ataque")
		$atack/CollisionShape2D.disabled = false
		atacando = true
		$sprite.animation = "ataque"#usado para impedir o problema de rodar apenas o frame 1 da animacao(ver comeco do codigo)
		
	movimento = move_and_slide(movimento, UP)


func _on_sprite_animation_finished():
	$sprite.play("parado")
	movimento.x = 0
	$atack/CollisionShape2D.disabled = true
	atacando = false
	 # Replace with function body.


func _on_atack_body_entered(body):
	body.dano()


func _on_dano_body_entered(body):
	if ScriptGlobal.vida == 0:
		$".".queue_free();
		
