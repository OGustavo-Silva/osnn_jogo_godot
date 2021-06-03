extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/inimigos.text = str(ScriptGlobal.inimigos_eliminados)
	var calculo_ponto = 1000 - int(ScriptGlobal.pontuacao_tempo_fase) * int(ScriptGlobal.pontuacao_inimigo)
	$ColorRect/pontuacao.text = str(calculo_ponto)
	$ColorRect/tempo.text = str(ScriptGlobal.pontuacao_tempo_fase) + "s"
	
	if(ScriptGlobal.fase_atual == 1):
		if(calculo_ponto > int(ScriptGlobal.melhor_pontuacao)):
			atualiza_pontuacao(calculo_ponto)
	
	if(ScriptGlobal.fase_atual == 2):
		if(calculo_ponto > int(ScriptGlobal.melhor_pontuacao_2)):
			atualiza_pontuacao2(calculo_ponto)
		
	if(ScriptGlobal.fase_atual == 3):
		if(calculo_ponto > int(ScriptGlobal.melhor_pontuacao_3)):
			atualiza_pontuacao3(calculo_ponto)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_proxima_pressed():
	if(ScriptGlobal.fase_atual == 1):
		get_tree().change_scene("res://assets/fase2.tscn")
	#elif(ScriptGlobal.fase_atual == 2):
	#	get_tree().change_scene("res://ass")
	
func atualiza_pontuacao(nova_pontuacao):
	var url = ScriptGlobal.url_atualiza_pontuacao
	var dados_envio = "id=" + str(ScriptGlobal.id_usuario) + "&nova_pontuacao=" + str(nova_pontuacao)
	var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] #para POST usamos application/json
	$HTTPRequest.request(url,cabecalho,false,HTTPClient.METHOD_POST,dados_envio)
	
func atualiza_pontuacao2(nova_pontuacao):
	var url = ScriptGlobal.url_atualiza_pontuacao2
	var dados_envio = "id=" + str(ScriptGlobal.id_usuario) + "&nova_pontuacao=" + str(nova_pontuacao)
	var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] #para POST usamos application/json
	$HTTPRequest.request(url,cabecalho,false,HTTPClient.METHOD_POST,dados_envio)
	
func atualiza_pontuacao3(nova_pontuacao):
	var url = ScriptGlobal.url_atualiza_pontuacao3
	var dados_envio = "id=" + str(ScriptGlobal.id_usuario) + "&nova_pontuacao=" + str(nova_pontuacao)
	var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] #para POST usamos application/json
	$HTTPRequest.request(url,cabecalho,false,HTTPClient.METHOD_POST,dados_envio)


func _on_btn_menu_pressed():
	get_tree().change_scene("res://assets/cena_menu.tscn")
