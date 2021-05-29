extends Node2D

var fase_selec = 1

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Verifica fase selecionada e altera cor de color rect
	if (fase_selec == 1):
		$"Fundo/Fase 1/color_fase1".color = Color(1,0,0,0.65)
		$"Fundo/Fase 2/color_fase2".color = Color(0.24,0.23,0.23,0.65)
	elif(fase_selec == 2):
		$"Fundo/Fase 2/color_fase2".color = Color(1,0,0,0.65)
		$"Fundo/Fase 3/color_fase3".color = Color(0.24,0.23,0.23,0.65)
		$"Fundo/Fase 1/color_fase1".color = Color(0.24,0.23,0.23,0.65)
	elif(fase_selec == 3):
		$"Fundo/Fase 3/color_fase3".color = Color(1,0,0,0.65)
		$"Fundo/Fase 2/color_fase2".color = Color(0.24,0.23,0.23,0.65)
		
	if(Input.is_action_just_pressed("ui_right") and fase_selec < 3):
		fase_selec += 1
	if(Input.is_action_just_pressed("ui_left") and fase_selec > 1):
		fase_selec -= 1



func iniciar_jogo():
	ScriptGlobal.fase = fase_selec
	
	get_tree().change_scene("res://assets/mundo.tscn")
