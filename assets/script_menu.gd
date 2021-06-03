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
	if(int(fase_selec) == 1):
		get_tree().change_scene("res://assets/mundo.tscn")
	elif(int(fase_selec) == 2 and int(ScriptGlobal.ult_fase) > 1):
		get_tree().change_scene("res://assets/fase2.tscn")
	elif(int(fase_selec) == 3 and int(ScriptGlobal.ult_fase) > 2):
		pass
		#get_tree().change_scene("res://ass")
	


func _on_Ranking_pressed():
	get_tree().change_scene("res://assets/cena_ranking.tscn")
