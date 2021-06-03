extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func enviar_requisicao_POST():
	var url_requisicao = ScriptGlobal.url_login
	var dados_envio = "email="+$ColorRect/email.text+"&senha="+$ColorRect/senha.text
	var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] #para POST usamos application/json
	$HTTPRequest.request(url_requisicao, cabecalho, false,HTTPClient.METHOD_POST, dados_envio) # requisicao para POST


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	if (json.result.size()>0):
		ScriptGlobal.id_usuario = json.result["id"]
		ScriptGlobal.nome_usuario = json.result["nome"]
		ScriptGlobal.melhor_pontuacao =  json.result["pontuacao"]
		ScriptGlobal.melhor_pontuacao_2 =  json.result["pontuacao_2"]
		ScriptGlobal.melhor_pontuacao_3 =  json.result["pontuacao_3"]
		ScriptGlobal.ult_fase = json.result["ult_fase"]
		ScriptGlobal.data_criacao = json.result["data_criacao"]
		ScriptGlobal.data_atualiza = json.result["data_atualiza"]
		print(ScriptGlobal.id_usuario)
		print(ScriptGlobal.nome_usuario)
		print(ScriptGlobal.data_criacao)
		get_tree().change_scene("res://assets/cena_menu.tscn")
	else:
		$AnimationPlayer.play("falha")
		
