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
	print(body)
	var json = JSON.parse(body.get_string_from_utf8())
	if (json.result.size()>0):
		ScriptGlobal.id_usuario = json.result["id"]
		ScriptGlobal.nome_usuario = json.result["nome"]
		print(ScriptGlobal.nome_usuario)
		ScriptGlobal.melhor_pontuacao =  json.result["pontuacao"]
		get_tree().change_scene("res://assets/mundo.tscn")
	else:
		#$AnimationPlayer.play("falha")
		pass
